table 50142 "Baker Recording Part"
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
        field(50106; "BM Offer Quantity"; Decimal)
        {
            Caption = 'BM Offer Quantity';
            DataClassification = CustomerContent;
        }
        field(50107; "BM Offer Balance"; Decimal)
        {
            Caption = 'BM Offer Balance Qty';
            DataClassification = CustomerContent;
        }
        field(50108; "Reference Line No"; Integer)
        {
            Caption = 'Reference Line No';
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
        LastLine: Record "Baker Recording Part";
        Header: Record "Production Recording Header";
        ProdRec: Record "Production Recording Part1";
    begin
        // Auto-assign line number
        if "Line No." = 0 then begin
            LastLine.SetRange("Assembly Order No", "Assembly Order No");
            if LastLine.FindLast() then
                "Line No." := LastLine."Line No." + 10000
            else
                "Line No." := 10000;
        end;

        // Update header with new quantity
        if Header.Get("Assembly Order No") then begin
            Header.LockTable();
            Header.Find();
            Header."baker Offred Total" := Header."baker Offred Total" + "Produce Quantity";
            Header."Baker Offred Balance" := Header."Prod Offred Total" - Header."baker Offred Total";
            Header."BM Offred Balance" := Header."BM Offred Balance" + Rec."Produce Quantity";
            Header.Modify(true); // Commit immediately
            // ProdRec.SetRange("Assembly Order No", "Assembly Order No");
            // ProdRec.SetRange("Line No.", "Reference Line No");
            // If ProdRec.FindFirst() Then begin
            // ProdRec."Baker Offer Quantity":= ProdRec."Baker Offer Quantity" + LastLine."Produce Quantity";
            // ProdRec."Baker Offer Balance" := ProdRec."Baker Offer Balance" - LastLine."Produce Quantity";
            // ProdRec.Modify(true);
            // end;
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