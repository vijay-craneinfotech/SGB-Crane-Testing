page 70321 "KichProdOrderHeaderList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "KichProdOrderHeader";
    Caption = 'Kitchen Prod. Order List';
    CardPageId = "KichProdOrderHeaderDoc";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("KichOrderNumber"; Rec."KichOrderNumber")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrderNumber';
                }
                field("ItemDescription"; Rec.ItemDescription)
                {
                    ApplicationArea = All;
                    Caption = 'ItemDescription';
                }
                field(KichOrderQuantity; Rec.KichOrderQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'KichOrderQuantity';
                }
               field("KichOrdStatus"; Rec."KichOrdStatus")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdStatus';
                    Editable = false;
                }
            }
        }
    }
}