page 50110 "Kitchen Section API"
{
    PageType = API;
    APIPublisher = 'CraneVJ';
    APIGroup = 'mobile';
    APIVersion = 'v1.0';
    EntityName = 'kitchenSection';
    EntitySetName = 'kitchenSections';
    SourceTable = "Kitchen Section Master";
    DelayedInsert = true;
    ODataKeyFields = Code;
    Caption = 'Kitchen Section API';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(code; Rec.Code)
                {
                    Caption = 'code';
                }
                field(description; Rec.Description)
                {
                    Caption = 'description';
                }
                field(status; Rec.Status)
                {
                    Caption = 'status';
                }
            }
        }
    }
}