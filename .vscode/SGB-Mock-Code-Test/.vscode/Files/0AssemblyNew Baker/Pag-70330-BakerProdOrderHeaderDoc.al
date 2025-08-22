page 70330 "BakerProdOrderHeaderDoc"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "KichProdOrderHeader";   //Header Table
    Caption = 'Baker Prod Order Header Doc';
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
                }
                field("BakProducedQuantityTotal"; Rec."BakProducedQuantityTotal")
                {
                    ApplicationArea = All;
                    Caption = 'BakProducedQuantityTotal';
                    Editable = false;
                    Style = Strong;
                }
                field("BakOrdBalanceQuantity"; Rec."BakOrdBalanceQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'BakOrdBalanceQuantity';
                    Editable = false;
                    Style = Strong;
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
            part(ProductionRecordings; "BakerProdOrderPartLines")
            {
                ApplicationArea = All;
                SubPageLink = "KichOrderNumber" = field("KichOrderNumber");
            }

        }

    }
}
