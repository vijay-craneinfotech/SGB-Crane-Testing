page 50174 "Baker Pending Production Lines"  // to display production lines which are pending for baker to produced
{
    APIGroup = 'ProductionAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'Baker Pending Production Lines';
    DelayedInsert = true;
    EntityName = 'BakerProductionLineDisplay';
    EntitySetName = 'BakerProductionLineDisplay';
    PageType = API;
    SourceTable = "KichProdOrderLines";
    SourceTableView = where("BakOrdBalanceQuantity" = filter(> 0));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(assemblyOrderNo; Rec."KichOrderNumber")
                {
                    Caption = 'Assembly Order No';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(lineNo; Rec."KichOrdLineNo")
                {
                    Caption = 'Line No.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(producedQty; Rec."KichProducedQuantity")
                {
                    Caption = 'Produced Quantity';
                    ApplicationArea = All;
                }
                field(productionDateTime; Rec."DateTime")
                {
                    Caption = 'Production Date/Time';
                    ApplicationArea = All;
                }
                field(manufacturingDate; Rec."ManufacturingDate")
                {
                    Caption = 'Manufacturing Date';
                    ApplicationArea = All;
                }
                field(expiryDate; Rec."ExpiryDate")
                {
                    Caption = 'Expiry Date';
                    ApplicationArea = All;
                }
            }
        }
    }
}