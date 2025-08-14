page 50171 "BM Recording PartList"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "BM Recording Part";
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
                field("QC Offer Quantity"; Rec."QC Offer Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'QC Offer Quantity';
                }
                field("QC Offer Balance"; Rec."QC Offer Balance")
                {
                    ApplicationArea = All;
                    Caption = 'QC Offer Balance Qty';
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