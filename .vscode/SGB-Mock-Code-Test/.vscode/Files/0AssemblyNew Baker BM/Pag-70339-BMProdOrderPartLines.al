page 70339 "BMProdOrderPartLines"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "BMProdOrderLines";
    Caption = 'BM Production Lines';
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
                field("BMProducedQuantity"; Rec."BMProducedQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'BMProducedQuantity';
                }
                field("QCProducedQuantity"; Rec."QCProducedQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'QCProducedQuantity';
                }
                field("QCOrdBalanceQuantity"; Rec."QCOrdBalanceQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'QCOrdBalanceQuantity';
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
                field("BMOrdStatus"; Rec."BMOrdStatus")
                {
                    ApplicationArea = All;
                    Caption = 'BMOrdStatus';
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