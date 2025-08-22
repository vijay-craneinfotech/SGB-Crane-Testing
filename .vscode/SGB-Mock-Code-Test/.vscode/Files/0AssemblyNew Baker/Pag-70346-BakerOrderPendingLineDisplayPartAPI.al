page 70346 "BakerOrderPendingDisplayPart"  // it gives correct Get response with header page 
{
    PageType = API;
    SourceTable = "KichProdOrderLines";
    Caption = 'BakerOrderPendingDisplayPart';  
    APIVersion = 'v1.0';
    APIGroup = 'AssemblyOrderAPI';
    EntityName = 'BakerOrderPendingDisplayPart';
    EntitySetName = 'BakerOrderPendingDisplayParts';
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
                field(KichProducedQuantity; Rec."KichProducedQuantity")
                {
                    Caption = 'KichProducedQuantity';
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
                field("KichOrdStatus"; Rec."KichOrdStatus")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdStatus';
                }
                field(BakProducedQuantity; Rec."BakProducedQuantity")
                {
                    Caption = 'BakProducedQuantity';
                    ApplicationArea = All;
                }
                field(BakOrdBalanceQuantity; Rec."BakOrdBalanceQuantity")
                {
                    Caption = 'BakOrdBalanceQuantity';
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
