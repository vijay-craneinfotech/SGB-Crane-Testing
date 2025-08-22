page 70331 "BakerProdOrderPartLines"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "BakerProdOrderLines";
    Caption = 'Baker Production Lines';
    InsertAllowed = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("KichOrderNumber"; Rec."KichOrderNumber")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrderNumber';
                    Editable = false;
                }
                field("KichOrdLineNo"; Rec."KichOrdLineNo")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdLineNo';
                    Editable = false;
                }
                field("BakerProducedQuantity"; Rec."BakerProducedQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'BakerProducedQuantity';
                }
                field("BMProducedQuantity"; Rec."BMProducedQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'BMProducedQuantity';
                }
                field("BMOrdBalanceQuantity"; Rec."BMOrdBalanceQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'BMOrdBalanceQuantity';
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
                field("DateTime"; Rec."DateTime")
                {
                    ApplicationArea = All;
                    Caption = 'DateTime';
                }
                field("KichOrdDueDate"; Rec."KichOrdDueDate")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdDueDate';
                }

                field("ManufacturingDate"; Rec."ManufacturingDate")
                {
                    Caption = 'Manufacturing Date';
                }
                field("ExpiryDate"; Rec."ExpiryDate")
                {
                    Caption = 'Expiry Date';
                }
                field("Reference Line No"; Rec."Reference Line No")
                {
                    Caption = 'Reference Line No';
                }
            }
        }
    }
}