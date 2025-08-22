page 70326 "KichProdHeaderStatusUpdate"
{
    PageType = API;
    APIGroup = 'ProductionAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'KichProdHeaderStatusUpdate';
    DelayedInsert = true;
    EntityName = 'KichProdHeaderStatusUpdate';
    EntitySetName = 'KichProdHeaderStatusUpdates';
    SourceTable = "KichProdOrderHeader";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId) // Needed for PATCH
                {
                    Caption = 'System Id';
                    ApplicationArea = All;
                }
                field(KichOrderNumber; Rec."KichOrderNumber")
                {
                    Caption = 'KichOrderNumber';
                    ApplicationArea = All;
                }
                field(KichOrdStatus; Rec."KichOrdStatus")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdStatus';
                }
            }
        }
    }
}
