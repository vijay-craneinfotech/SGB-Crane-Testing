page 50105 "Mob App User Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mob App User";
    Caption = 'Mobile App User';

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
                field(Pwd; Rec.Pwd)
                {
                    ApplicationArea = All;
                }
                field("Email ID"; Rec."Email ID")
                {
                    ApplicationArea = All;
                }
                field("User Field of BC"; Rec."User Field of BC")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Reset Pwd Token"; Rec."Reset Pwd Token")
                {
                    ApplicationArea = All;
                }
                field("Type of User"; Rec."Type of User")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}