page 50162 "Production Recording PartList"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Production Recording Part1";
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
                field("Baker Offer Quantity"; Rec."Baker Offer Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Baker Offer Quantity';
                }
                field("Baker Offer Balance"; Rec."Baker Offer Balance")
                {
                    ApplicationArea = All;
                    Caption = 'Baker Offer Balance Qty';
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