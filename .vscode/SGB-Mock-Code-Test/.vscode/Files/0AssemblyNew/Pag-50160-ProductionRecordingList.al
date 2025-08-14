page 50160 "Assembly Production List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Production Recording Header";
    Caption = 'Assembly Production Recording';
    CardPageId = "Production Recording Header";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Assembly Order"; Rec."Assembly Order No")
                {
                    ApplicationArea = All;
                    Caption = 'Assembly Order';
                }
                field("Product"; Rec."Product")
                {
                    ApplicationArea = All;
                    Caption = 'Product';
                }
                field(OrderQuantity; Rec.OrderQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'Order Quantity';
                }
                field(AssemblyQuantity; Rec.AssemblyQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'Assembly Quantity';
                }
            }
        }
    }
}