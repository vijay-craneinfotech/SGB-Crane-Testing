table 70124 "BMProdOrderLines"
{
    DataClassification = CustomerContent;
    Caption = 'BMProdOrderLines';

    fields
    {
        field(50100; "KichOrderNumber"; Code[20])
        {
            Caption = 'KichOrderNumber';
            TableRelation = "Assembly Header"."No.";
        }
        field(50101; "KichOrdLineNo"; Integer)
        {
            Caption = 'KichOrdLineNo';
        }
        field(50102; "ItemCode"; Code[20])
        {
            Caption = 'ItemCode';
        }
        field(50103; "ItemDescription"; Text[100])
        {
            Caption = 'Item Description';
        }
        field(50104; "BMProducedQuantity"; Decimal)
        {
            Caption = 'BMProducedQuantity';
        }
        field(50105; "DateTime"; DateTime)
        {
            Caption = 'DateTime';
        }
        field(50106; "ManufacturingDate"; Date)
        {
            Caption = 'ManufacturingDate';
            DataClassification = CustomerContent;
        }
        field(50107; "ExpiryDate"; Date)
        {
            Caption = 'ExpiryDate';
            DataClassification = CustomerContent;
        }
        field(50108; "KichOrdDueDate"; Date)
        {
            Caption = 'Kich Order Due Date';
            DataClassification = CustomerContent;
        }
        field(50109; "BMOrdStatus"; Enum "Prod Status")
        {
            Caption = 'BMOrdStatus';
            DataClassification = CustomerContent;
            InitValue = Pending;
        }
        field(50110; "QCProducedQuantity"; Decimal)
        {
            Caption = 'QCProducedQuantity';
            DataClassification = CustomerContent;
        }
        field(50111; "QCOrdBalanceQuantity"; Decimal)
        {
            Caption = 'QCOrdBalanceQuantity';
            DataClassification = CustomerContent;
        }
        field(50112; "UserName"; Text[100])
        {
            Caption = 'User Name';
        }
        field(50113; "BatchNo"; Text[100])
        {
            Caption = 'Batch No.';
        }
        field(50114; "Reference Line No"; Integer)
        {
            Caption = 'Reference Line No';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "KichOrderNumber", "KichOrdLineNo")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        LastLine: Record "BMProdOrderLines";
        Header: Record "KichProdOrderHeader";
        ProdRec: Record "BakerProdOrderLines";
    begin
        // Auto-assign line number
        if "KichOrdLineNo" = 0 then begin
            LastLine.SetRange("KichOrderNumber", "KichOrderNumber");
            if LastLine.FindLast() then
                "KichOrdLineNo" := LastLine."KichOrdLineNo" + 10000
            else
                "KichOrdLineNo" := 10000;
        end;

        // Update header with new quantity
        if Header.Get("KichOrderNumber") then begin
            Header.LockTable();
            Header.Find();
            Header."BMProducedQuantityTotal" := Header."BMProducedQuantityTotal" + "BMProducedQuantity";
            Header."BMOrdBalanceQuantity" := Header."BakProducedQuantityTotal" - Header."BMProducedQuantityTotal";
            Header."QCOrdBalanceQuantity" := Header."QCOrdBalanceQuantity" + Rec."BMProducedQuantity";
            Header.Modify(true); // Commit immediately

            // Update parent production record (if reference exists)
            if "Reference Line No" <> 0 then begin
                ProdRec.Reset();
                ProdRec.SetRange("KichOrderNumber", "KichOrderNumber");
                ProdRec.SetRange("KichOrdLineNo", "Reference Line No");
                if ProdRec.FindFirst() then begin
                    ProdRec.LockTable();
                    //ProdRec.Find();
                    ProdRec."BMProducedQuantity" := ProdRec."BMProducedQuantity" + "BMProducedQuantity";
                    ProdRec."BMOrdBalanceQuantity" := ProdRec."BMOrdBalanceQuantity" - "BMProducedQuantity";
                    ProdRec.Modify(true);
                    Commit();
                end;
            end;

        end;
    end;

    trigger OnModify()
    var
        Header: Record "KichProdOrderHeader";
        QuantityDelta: Decimal;
    begin
        // Calculate quantity change
        QuantityDelta := Rec."BMProducedQuantity" - xRec."BMProducedQuantity";
        if QuantityDelta = 0 then exit; // No change in quantity

        // Update header with delta
        if Header.Get("KichOrderNumber") then begin
            Header.LockTable();
            Header.Find();
            Header."BMProducedQuantityTotal" := Header."BMProducedQuantityTotal" + QuantityDelta;
            Header."BMOrdBalanceQuantity" := Header."BakProducedQuantityTotal" - Header."BMProducedQuantityTotal";
            //Header."BM Log Balance" := Header."Baker Log Balance"-Rec."Produce Quantity";
            Header.Modify(true);
        end;
    end;

    trigger OnDelete()
    var
        Header: Record "KichProdOrderHeader";
    begin
        // Update header by removing deleted quantity
        if Header.Get("KichOrderNumber") then begin
            Header.LockTable();
            Header.Find();
            Header."BMProducedQuantityTotal" := Header."BMProducedQuantityTotal" - xRec."BMProducedQuantity";
            Header."BMOrdBalanceQuantity" := Header."BakProducedQuantityTotal" - Header."BMProducedQuantityTotal";
            Header."QCOrdBalanceQuantity" := Header."BMOrdBalanceQuantity" - Rec."BMProducedQuantity";
            Header.Modify(true);
        end;
    end;
}