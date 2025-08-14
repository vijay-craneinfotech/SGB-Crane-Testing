page 50167 "Baker Recording PartList"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Baker Recording Part";
    Caption = 'Production Recordings';
    InsertAllowed = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Assembly Order No."; Rec."Assembly Order No")
                {
                    ApplicationArea = All;
                    Caption = 'Assembly Order';
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Caption = 'Line No.';
                    Editable = false;
                }
                field("Produced Qty."; Rec."Produce Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Produced Quantity';
                }
                field("BM Offer Quantity"; Rec."BM Offer Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'BM Offer Quantity';
                }
                field("BM Offer Balance"; Rec."BM Offer Balance")
                {
                    ApplicationArea = All;
                    Caption = 'BM Offer Balance Qty';
                }
                field("Production DateTime"; Rec."Production DateTime")
                {
                    ApplicationArea = All;
                    Caption = 'Asly Prod Date';
                }

                field("Manufacturing Date"; Rec."Manufacturing Date")
                {
                    Caption = 'Manufacturing Date';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    Caption = 'Expiry Date';
                }
            }
        }
    }
}