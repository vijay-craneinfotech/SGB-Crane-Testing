page 50166 "Baker Recording Header"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Production Recording Header";
    Caption = 'Assembly Production Order Baker';
    SourceTableView = where("Assembly Order No" = filter(<> ''));

    layout
    {
        area(Content)
        {
            group(Header)
            {
                field("Assembly Order"; Rec."Assembly Order No")
                {
                    ApplicationArea = All;
                    Caption = 'Assembly Order';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                    //Editable = false;
                }
                field(Product; Rec.Product)
                {
                    ApplicationArea = All;
                    Caption = 'Product';
                    Editable = false;
                }
                field(OrderQuantity; Rec.OrderQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'Order Quantity';
                }
                field("Prod Offred Total"; Rec."Prod Offred Total")
                {
                    ApplicationArea = All;
                    Caption = 'Prod Offred Total';
                    Editable = false;
                    Style = Strong;

                }
                field("Prod Offred Balance"; Rec."Prod Offred Balance")
                {
                    ApplicationArea = All;
                    Caption = 'Prod Offred Balance';
                    Editable = false;
                    Style = Strong;
                }
                field("Baker Offred Total"; Rec."baker Offred Total")
                {
                    ApplicationArea = All;
                    Caption = 'Baker Offred Total';
                    Editable = false;
                }
                field("Baker Offred Balance"; Rec."Baker Offred Balance")
                {
                    ApplicationArea = All;
                    Caption = 'Baker Offred Balance';
                    Editable = false;
                }
                field("BM Offred Total"; Rec."BM Offred Total")
                {
                    ApplicationArea = All;
                    Caption = 'BM Offred Total';
                    Editable = false;
                }
                field("BM Offred Balance"; Rec."BM Offred Balance")
                {
                    ApplicationArea = All;
                    Caption = 'BM Offred Balance';
                    Editable = false;
                }
                field("QC Offred Total"; Rec."QC Offred Total")
                {
                    ApplicationArea = All;
                    Caption = 'QC Offred Total';
                    Editable = false;
                }
                field("QC Offred Balance"; Rec."QC Offred Balance")
                {
                    ApplicationArea = All;
                    Caption = 'QC Offred Balance';
                    Editable = false;
                }
            }
            part(ProductionRecordings; "Baker Recording PartList")
            {
                ApplicationArea = All;
                SubPageLink = "Assembly Order No" = field("Assembly Order No");
            }

        }

    }
}
