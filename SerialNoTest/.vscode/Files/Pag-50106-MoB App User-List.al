page 50106 "Mob App User List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mob App User";
    Caption = 'Mobile App Users';
    CardPageId = "Mob App User Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field("Email ID"; Rec."Email ID")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
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