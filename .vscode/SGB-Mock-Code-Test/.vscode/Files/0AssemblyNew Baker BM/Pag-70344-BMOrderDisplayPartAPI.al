page 70344 "BMOrderDisplayPart"  // it gives correct Get response with header page 
{
    PageType = API;
    SourceTable = "BMProdOrderLines";
    Caption = 'BMOrderDisplayPart';  
    APIVersion = 'v1.0';
    APIGroup = 'AssemblyOrderAPI';
    EntityName = 'BMOrderDisplayPart';
    EntitySetName = 'BMOrderDisplayParts';
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
                field(BMProducedQuantity; Rec."BMProducedQuantity")
                {
                    Caption = 'BMProducedQuantity';
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
                field("KichOrdStatus"; Rec."BMOrdStatus")
                {
                    ApplicationArea = All;
                    Caption = 'BMOrdStatus';
                }
                field(QCProducedQuantity; Rec."QCProducedQuantity")
                {
                    Caption = 'QCProducedQuantity';
                    ApplicationArea = All;
                }
                field(QCOrdBalanceQuantity; Rec."QCOrdBalanceQuantity")
                {
                    Caption = 'QCOrdBalanceQuantity';
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
