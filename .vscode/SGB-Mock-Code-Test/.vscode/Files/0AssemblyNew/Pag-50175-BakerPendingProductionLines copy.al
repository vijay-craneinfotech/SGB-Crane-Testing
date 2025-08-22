page 50175 "BM Pending Production Lines"  // to display production lines which are pending for baker to produced
{
    APIGroup = 'ProductionAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'BM Pending Production Lines';
    DelayedInsert = true;
    EntityName = 'BMProductionLineDisplay';
    EntitySetName = 'BMProductionLineDisplay';
    PageType = API;
    SourceTable = "BakerProdOrderLines";
    SourceTableView = where("BMOrdBalanceQuantity" = filter(> 0));

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
                field(producedQty; Rec."BakerProducedQuantity")
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