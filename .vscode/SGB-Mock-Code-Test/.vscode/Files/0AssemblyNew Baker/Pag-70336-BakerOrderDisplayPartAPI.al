page 70336 "BakerOrderDisplayPart"  // it gives correct Get response with header page 
{
    PageType = API;
    SourceTable = "BakerProdOrderLines";
    Caption = 'BakerOrderDisplayPart';  
    APIVersion = 'v1.0';
    APIGroup = 'AssemblyOrderAPI';
    EntityName = 'BakerOrderDisplayPart';
    EntitySetName = 'BakerOrderDisplayParts';
    APIPublisher = 'VJ';
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(KichOrderNumber; Rec."KichOrderNumber")
                {
                    Caption = 'KichOrderNumber';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(KichOrdLineNo; Rec."KichOrdLineNo")
                {
                    Caption = 'KichOrdLineNo';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BakerProducedQuantity; Rec."BakerProducedQuantity")
                {
                    Caption = 'BakerProducedQuantity';
                    ApplicationArea = All;
                }
                field("UserName"; Rec."UserName")
                {
                    ApplicationArea = All;
                    Caption = 'UserName';
                }
                field("ItemCode"; Rec."ItemCode")
                {
                    ApplicationArea = All;
                    Caption = 'ItemCode';
                    //Editable = false;
                }
                field("ItemDescription"; Rec.ItemDescription)
                {
                    ApplicationArea = All;
                    Caption = 'ItemDescription';
                    Editable = false;
                }
                field("BakerOrdStatus"; Rec."BakerOrdStatus")
                {
                    ApplicationArea = All;
                    Caption = 'BakerOrdStatus';
                }
                field(BMProducedQuantity; Rec."BMProducedQuantity")
                {
                    Caption = 'BMProducedQuantity';
                    ApplicationArea = All;
                }
                field(BMOrdBalanceQuantity; Rec."BMOrdBalanceQuantity")
                {
                    Caption = 'BMOrdBalanceQuantity';
                    ApplicationArea = All;
                }
                field("KichOrdDueDate"; Rec."KichOrdDueDate")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdDueDate';
                }
                field(DateTime; Rec."DateTime")
                {
                    Caption = 'DateTime';
                    ApplicationArea = All;
                }
                field(ManufacturingDate; Rec."ManufacturingDate")
                {
                    Caption = 'ManufacturingDate';
                    ApplicationArea = All;
                }
                field(ExpiryDate; Rec."ExpiryDate")
                {
                    Caption = 'ExpiryDate';
                    ApplicationArea = All;
                }
            }
        }
    }
}
