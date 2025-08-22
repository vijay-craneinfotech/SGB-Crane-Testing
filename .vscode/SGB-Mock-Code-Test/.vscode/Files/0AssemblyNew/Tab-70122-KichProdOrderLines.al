table 70122 "KichProdOrderLines"
{
    DataClassification = CustomerContent;
    Caption = 'KichProdOrderLines';

    //KichOrderNumber ..
    //KichOrdLineNo ..
    //ItemCode   ..
    //ItemDescription  ..
    //ItemImage               // direct in Payload
    //KichProducedQuantity  ..
    //KichOrdDueDate   ..
    //KichOrdStatus -- Hold, Pending, WIP    ..
    //UserName   ..
    //DateTime ..
    //ManufacturingDate  ..
    //ExpiryDate ..
    //BatchNo ..

    //BakOrdBalanceQuantity
    //BakProducedQuantity

    fields
    {
        field(50100; "KichOrderNumber"; Code[20])
        {
            Caption = 'Assembly Order No.';
            TableRelation = "KichProdOrderHeader"."KichOrderNumber";
        }
        field(50101; "KichOrdLineNo"; Integer)
        {
            Caption = 'Assembly Order Line No.';
        }
        field(50108; "ItemCode"; Code[20])
        {
            Caption = 'ItemCode';
        }
        field(50110; "ItemDescription"; Text[100])
        {
            Caption = 'Item Description';
        }
        field(50102; "KichProducedQuantity"; Decimal)
        {
            Caption = 'kich Produced Quantity';
        }
        field(50103; "DateTime"; DateTime)
        {
            Caption = 'DateTime';
        }
        field(50104; "ManufacturingDate"; Date)
        {
            Caption = 'Manufacturing Date';
            DataClassification = CustomerContent;
        }
        field(50105; "ExpiryDate"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = CustomerContent;
        }
        field(50111; "KichOrdDueDate"; Date)
        {
            Caption = 'Kich Order Due Date';
            DataClassification = CustomerContent;
        }
        field(50112; "KichOrdStatus"; Enum "Prod Status")
        {
            Caption = 'KichOrdStatus';
            DataClassification = CustomerContent;
            InitValue = Pending;
        }
        field(50106; "BakProducedQuantity"; Decimal)
        {
            Caption = 'BakProducedQuantity';
            DataClassification = CustomerContent;
        }
        field(50107; "BakOrdBalanceQuantity"; Decimal)
        {
            Caption = 'BakOrdBalanceQuantity';
            DataClassification = CustomerContent;
        }

        field(50113; "UserName"; Text[100])
        {
            Caption = 'User Name';
        }
        field(50114; "BatchNo"; Text[100])
        {
            Caption = 'Batch No.';
        }
    }

    keys
    {
        key(PK; "KichOrderNumber", "KichOrdLineNo")
        {
            Clustered = true;
        }
        key(AssemblyNo; "KichOrderNumber")
        {
            Clustered = false;
        }
    }

    trigger OnInsert()
    var
        LastLine: Record "KichProdOrderLines";
        Header: Record "KichProdOrderHeader";
    begin
        // Auto-assign line number
        if "KichOrdLineNo" = 0 then begin
            LastLine.SetRange("KichOrderNumber", "KichOrderNumber");
            if LastLine.FindLast() then
                "KichOrdLineNo" := LastLine."KichOrdLineNo" + 10000
            else
                "KichOrdLineNo" := 10000;
        end;

        Rec."BakOrdBalanceQuantity" := "KichProducedQuantity";

        // Update header with new quantity
        if Header.Get("KichOrderNumber") then begin
            Header.LockTable();
            Header.Find();
            Header."KichProducedQuantityTotal" := Header."KichProducedQuantityTotal" + "KichProducedQuantity";
            Header."KichOrdBalanceQuantity" := Header.KichOrderQuantity - Header."KichProducedQuantityTotal";
            Header."BakOrdBalanceQuantity" := Header."BakOrdBalanceQuantity" + Rec."KichProducedQuantity";
            Header.Modify(true); // Commit immediately
        end;
    end;

    trigger OnModify()
    var
        Header: Record "KichProdOrderHeader";
        QuantityDelta: Decimal;
    begin
        // Calculate quantity change
        QuantityDelta := Rec."KichProducedQuantity" - xRec."KichProducedQuantity";
        if QuantityDelta = 0 then exit; // No change in quantity

        // Update header with delta
        if Header.Get("KichOrderNumber") then begin
            Header.LockTable();
            Header.Find();
            Header."KichProducedQuantityTotal" := Header."KichProducedQuantityTotal" + QuantityDelta;
            Header."KichOrdBalanceQuantity" := Header.KichOrderQuantity - Header."KichProducedQuantityTotal";
            //Header."Baker Log Balance" := Header."Baker Log Balance"-Rec."Produce Quantity";
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
            Header."KichProducedQuantityTotal" := Header."KichProducedQuantityTotal" - xRec."KichProducedQuantity";
            Header."KichOrdBalanceQuantity" := Header.KichOrderQuantity - Header."KichProducedQuantityTotal";
            Header."BakOrdBalanceQuantity" := Header."BakOrdBalanceQuantity" - Rec."KichProducedQuantity";
            Header.Modify(true); // Commit immediately
        end;
    end;
}