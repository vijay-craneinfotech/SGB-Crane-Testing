table 50141 "Production Recording Part1"
{
    DataClassification = CustomerContent;
    Caption = 'Assembly Production Recording';

    fields
    {
        field(50100; "Assembly Order No"; Code[20])
        {
            Caption = 'Assembly Order No.';
            TableRelation = "Assembly Header"."No.";
        }
        field(50101; "Line No."; Integer)
        {
            Caption = 'Assembly Order Line No.';
        }
        field(50102; "Produce Quantity"; Decimal)
        {
            Caption = 'Produce Quantity';
        }
        field(50103; "Production DateTime"; DateTime)
        {
            Caption = 'Production Date/Time';
        }
        field(50104; "Manufacturing Date"; Date)
        {
            Caption = 'Manufacturing Date';
            DataClassification = CustomerContent;
        }
        field(50105; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = CustomerContent;
        }
        field(50106; "Baker Offer Quantity"; Decimal)
        {
            Caption = 'Baker Offer Quantity';
            DataClassification = CustomerContent;
        }
        field(50107; "Baker Offer Balance"; Decimal)
        {
            Caption = 'Baker Offer Balance Qty';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Assembly Order No", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        LastLine: Record "Production Recording Part1";
        Header: Record "Production Recording Header";
    begin
        // Auto-assign line number
        if "Line No." = 0 then begin
            LastLine.SetRange("Assembly Order No", "Assembly Order No");
            if LastLine.FindLast() then
                "Line No." := LastLine."Line No." + 10000
            else
                "Line No." := 10000;
        end;

        Rec."Baker Offer Balance":= "Produce Quantity";

        // Update header with new quantity
        if Header.Get("Assembly Order No") then begin
            Header.LockTable();
            Header.Find();
            Header."Prod Offred Total" := Header."Prod Offred Total" + "Produce Quantity";
            Header."Prod Offred Balance" := Header.OrderQuantity - Header."Prod Offred Total";
            Header."Baker Offred Balance" := Header."Baker Offred Balance" + Rec."Produce Quantity";
            Header.Modify(true); // Commit immediately
        end;
    end;

    trigger OnModify()
    var
        Header: Record "Production Recording Header";
        QuantityDelta: Decimal;
    begin
        // Calculate quantity change
        QuantityDelta := Rec."Produce Quantity" - xRec."Produce Quantity";
        if QuantityDelta = 0 then exit; // No change in quantity

        // Update header with delta
        if Header.Get("Assembly Order No") then begin
            Header.LockTable();
            Header.Find();
            Header."Prod Offred Total" := Header."Prod Offred Total" + QuantityDelta;
            Header."Prod Offred Balance" := Header.OrderQuantity - Header."Prod Offred Total";
            //Header."Baker Log Balance" := Header."Baker Log Balance"-Rec."Produce Quantity";
            Header.Modify(true);
        end;
    end;

    trigger OnDelete()
    var
        Header: Record "Production Recording Header";
    begin
        // Update header by removing deleted quantity
        if Header.Get("Assembly Order No") then begin
            Header.LockTable();
            Header.Find();
            Header."Prod Offred Total" := Header."Prod Offred Total" - xRec."Produce Quantity";
            Header."Prod Offred Balance" := Header.OrderQuantity - Header."Prod Offred Total";
            Header."Baker Offred Balance" := Header."Baker Offred Balance" - Rec."Produce Quantity";
            Header.Modify(true); // Commit immediately
        end;
    end;
}