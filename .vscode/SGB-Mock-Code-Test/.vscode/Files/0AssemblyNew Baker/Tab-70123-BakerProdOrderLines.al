table 70123 "BakerProdOrderLines"
{
    DataClassification = CustomerContent;
    Caption = 'BakerProdOrderLines';

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
        field(50104; "BakerProducedQuantity"; Decimal)
        {
            Caption = 'BakerProducedQuantity';
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
        field(50109; "BakerOrdStatus"; Enum "Prod Status")
        {
            Caption = 'BakerOrdStatus';
            DataClassification = CustomerContent;
            InitValue = Pending;
        }
        field(50110; "BMProducedQuantity"; Decimal)
        {
            Caption = 'BMProducedQuantity';
            DataClassification = CustomerContent;
        }
        field(50111; "BMOrdBalanceQuantity"; Decimal)
        {
            Caption = 'BMOrdBalanceQuantity';
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
        LastLine: Record "BakerProdOrderLines";
        Header: Record "KichProdOrderHeader";
        ProdRec: Record "KichProdOrderLines";
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
            Header."BakProducedQuantityTotal" := Header."BakProducedQuantityTotal" + "BakerProducedQuantity";
            Header."BakOrdBalanceQuantity" := Header."KichProducedQuantityTotal" - Header."BakProducedQuantityTotal";
            Header."BMOrdBalanceQuantity" := Header."BMOrdBalanceQuantity" + Rec."BakerProducedQuantity";
            Header.Modify(true); // Commit immediately

            // ProdRec.Reset();
            // ProdRec.SetRange("Assembly Order No", Rec."Assembly Order No");
            // ProdRec.SetRange("Line No.", Rec."Reference Line No"); // Make sure this is unique for the intended record
            // if ProdRec.FindSet() then begin
            //     repeat
            //     ProdRec."Baker Offer Quantity" := ProdRec."Baker Offer Quantity" + LastLine."Produce Quantity";
            //     ProdRec."Baker Offer Balance" := ProdRec."Baker Offer Balance" - LastLine."Produce Quantity";
            //     ProdRec.Modify(true);
            //     until ProdRec.Next() = 0;
            // end;
            // Update parent production record (if reference exists)
            if "Reference Line No" <> 0 then begin
                ProdRec.Reset();
                ProdRec.SetRange("KichOrderNumber", "KichOrderNumber");
                ProdRec.SetRange("KichOrdLineNo", "Reference Line No");
                if ProdRec.FindFirst() then begin
                    ProdRec.LockTable();
                    //ProdRec.Find();
                    ProdRec."BakProducedQuantity" := ProdRec."BakProducedQuantity" + "BakerProducedQuantity";
                    ProdRec."BakOrdBalanceQuantity" := ProdRec."BakOrdBalanceQuantity" - "BakerProducedQuantity";
                    ProdRec.Modify(true);
                    Commit();
                end;
            end;

        end;
    end;


    // trigger OnModify()
    // var
    //     Header: Record "Production Recording Header";
    //     QuantityDelta: Decimal;
    // begin
    //     // Calculate quantity change
    //     QuantityDelta := Rec."Produce Quantity" - xRec."Produce Quantity";
    //     if QuantityDelta = 0 then exit; // No change in quantity

    //     // Update header with delta
    //     if Header.Get("Assembly Order No") then begin
    //         Header.LockTable();
    //         Header.Find();
    //         Header."baker Offred Total" := Header."baker Offred Total" + QuantityDelta;
    //         Header."Baker Offred Balance" := Header."Prod Offred Total" - Header."baker Offred Total";
    //         //Header."BM Log Balance" := Header."Baker Log Balance"-Rec."Produce Quantity";
    //         Header.Modify(true);
    //     end;
    // end;

    // trigger OnDelete()
    // var
    //     Header: Record "Production Recording Header";
    // begin
    //     // Update header by removing deleted quantity
    //     if Header.Get("Assembly Order No") then begin
    //         Header.LockTable();
    //         Header.Find();
    //         Header."baker Offred Total" := Header."baker Offred Total" - xRec."Produce Quantity";
    //         Header."Baker Offred Balance" := Header."Prod Offred Total" - Header."baker Offred Total";
    //         Header."BM Offred Balance" := Header."BM Offred Balance" - Rec."Produce Quantity";
    //         Header.Modify(true);
    //     end;
    // end;
}