page 70334 "BakerProdHeaderStatusUpdate"    //i think this is only one
{
    PageType = API;
    APIGroup = 'ProductionAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'BakerProdHeaderStatusUpdate';
    DelayedInsert = true;
    EntityName = 'BakerProdHeaderStatusUpdate';
    EntitySetName = 'BakerProdHeaderStatusUpdates';
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
