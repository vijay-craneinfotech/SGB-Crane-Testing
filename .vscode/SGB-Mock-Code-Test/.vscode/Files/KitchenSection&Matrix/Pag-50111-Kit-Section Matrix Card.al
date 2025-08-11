page 50111 "Kit-Section Matrix Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Kit-Section Matrix";
    Caption = 'Kit-Section Matrix';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = All;
                }
                field("Section Description"; Rec."Section Description")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}