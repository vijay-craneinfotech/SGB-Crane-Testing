page 70337 "BMProdOrderHeaderList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "KichProdOrderHeader";
    Caption = 'BM Prod. Order List';
    CardPageId = "BMProdOrderHeaderDoc";
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