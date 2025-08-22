page 70323 "KichProdOrderPartLines"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "KichProdOrderLines";
    Caption = 'KichProdOrderPartList';
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
                field("KichProducedQuantity"; Rec."KichProducedQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'KichProducedQuantity';
                }
                field("BakProducedQuantity"; Rec."BakProducedQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'BakProducedQuantity';
                }
                field("BakOrdBalanceQuantity"; Rec."BakOrdBalanceQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'BakOrdBalanceQuantity';
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
            }
        }
    }

}