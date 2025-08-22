page 70322 "KichProdOrderHeaderDoc"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "KichProdOrderHeader";
    Caption = 'Kitchen Prod Order Header Doc';
    SourceTableView = where("KichOrderNumber" = filter(<> ''));

    layout
    {
        area(Content)
        {
            group(Header)
            {
                field("KichOrderNumber"; Rec."KichOrderNumber")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrderNumber';
                }
                field("ItemCode"; Rec."ItemCode")
                {
                    ApplicationArea = All;
                    Caption = 'ItemCode';
                    //Editable = false;
                }
                field(ItemDescription; Rec.ItemDescription)
                {
                    ApplicationArea = All;
                    Caption = 'ItemDescription';
                    // Editable = false;
                }
                field(KichSection; Rec."KichSection")
                {
                    Caption = 'KichSection';
                    ApplicationArea = All;
                }
                field(KichSectionName; Rec."KichSectionName")
                {
                    Caption = 'KichSectionName';
                    ApplicationArea = All;
                }
                field(KichOrdDueDate; Rec."KichOrdDueDate")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdDueDate';
                    Editable = false;
                }
                field("KichOrdStatus"; Rec."KichOrdStatus")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdStatus';
                    Editable = false;
                }
                field(KichOrderQuantity; Rec.KichOrderQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'KichOrderQuantity';
                    Style = Strong;
                }
                field("KichProducedQuantityTotal"; Rec."KichProducedQuantityTotal")
                {
                    ApplicationArea = All;
                    Caption = 'KichProducedQuantityTotal';
                    Editable = false;
                    Style = Strong;

                }
                field("KichOrdBalanceQuantity"; Rec."KichOrdBalanceQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdBalanceQuantity';
                    Editable = false;
                    Style = Strong;
                }
                field("BakProducedQuantityTotal"; Rec."BakProducedQuantityTotal")
                {
                    ApplicationArea = All;
                    Caption = 'BakProducedQuantityTotal';
                    Editable = false;
                }
                field("BakOrdBalanceQuantity"; Rec."BakOrdBalanceQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'BakOrdBalanceQuantity';
                    Editable = false;
                }
                field("BMProducedQuantityTotal"; Rec."BMProducedQuantityTotal")
                {
                    ApplicationArea = All;
                    Caption = 'BMProducedQuantityTotal';
                    Editable = false;
                }
                field("BMOrdBalanceQuantity"; Rec."BMOrdBalanceQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'BMOrdBalanceQuantity';
                    Editable = false;
                }
                field("QCProducedQuantityTotal"; Rec."QCProducedQuantityTotal")
                {
                    ApplicationArea = All;
                    Caption = 'QCProducedQuantityTotal';
                    Editable = false;
                }
                field("QCOrdBalanceQuantity"; Rec."QCOrdBalanceQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'QCOrdBalanceQuantity';
                    Editable = false;
                }

            }
            part(ProductionRecordings; "KichProdOrderPartLines")
            {
                ApplicationArea = All;
                SubPageLink = "KichOrderNumber" = field("KichOrderNumber");
            }

        }

    }
    // trigger OnAfterGetCurrRecord()
    // begin
    //     Rec."Prod Log Balance" := Rec.OrderQuantity - Rec."Prod Log Total";
    // end;

}

