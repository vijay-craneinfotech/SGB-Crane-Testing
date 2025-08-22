page 50152 "Assembly Production Line List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "KichProdOrderLines";
    Caption = 'Assembly Production Recording list';
    CardPageId = "KichProdOrderPartLines";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Assembly Order No."; Rec."KichOrderNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Assembly Order';
                    Editable = false;
                }
                field("Line No."; Rec."KichOrdLineNo")
                {
                    ApplicationArea = All;
                    Caption = 'Line No.';
                    Editable = false;
                }
                field("Produced Qty."; Rec."KichProducedQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'Produced Quantity';
                }
                field("Baker Offer Quantity"; Rec."BakProducedQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'Baker Offer Quantity';
                }
                field("Baker Offer Balance"; Rec."BakOrdBalanceQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'Baker Offer Balance Qty';
                }

                field("Production DateTime"; Rec."DateTime")
                {
                    ApplicationArea = All;
                    Caption = 'Asly Prod Date';
                }

                field("Manufacturing Date"; Rec."ManufacturingDate")
                {
                    Caption = 'Manufacturing Date';
                }
                field("Expiry Date"; Rec."ExpiryDate")
                {
                    Caption = 'Expiry Date';
                }
            }
        }
    }
}