page 70329 "BakerProdOrderHeaderList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "KichProdOrderHeader";   //Header Table
    Caption = 'Baker Prod. Order List';
    CardPageId = "BakerProdOrderHeaderDoc";
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