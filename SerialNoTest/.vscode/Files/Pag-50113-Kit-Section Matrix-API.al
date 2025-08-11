page 50113 "Kit-Section Matrix API"
{
    PageType = API;
    APIPublisher = 'CraneVJ';
    APIGroup = 'mobile';
    APIVersion = 'v1.0';
    EntityName = 'kitSectionMatrix';
    EntitySetName = 'kitSectionMatrices';
    SourceTable = "Kit-Section Matrix";
    DelayedInsert = true;
    ODataKeyFields = "User ID", "Section Code";
    Caption = 'Kit-Section Matrix API';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(userID; Rec."User ID")
                {
                    Caption = 'userID';
                }
                field(sectionCode; Rec."Section Code")
                {
                    Caption = 'sectionCode';
                }
                field(status; Rec.Status)
                {
                    Caption = 'status';
                }
                field(userName; Rec."User Name")
                {
                    Caption = 'userName';
                }
                field(sectionDescription; Rec."Section Description")
                {
                    Caption = 'sectionDescription';
                }
            }
        }
    }
}