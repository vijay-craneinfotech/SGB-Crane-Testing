page 70340 "BMOrderHeader" // kichOrderHeader
{
    PageType = API;
    APIGroup = 'ProductionAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'BMOrderHeader';
    DelayedInsert = true;
    EntityName = 'BMOrderPending';            //KichOrderPending
    EntitySetName = 'BMOrderPendings';         //KichOrderPendings
    SourceTable = "KichProdOrderHeader";
    SourceTableView = where("BMOrdBalanceQuantity" = filter(> 0));


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(KichOrderNumber; Rec."KichOrderNumber")
                {
                    Caption = 'KichOrderNumber';
                    ApplicationArea = All;
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
                field(ItemCode; Rec."ItemCode")
                {
                    Caption = 'ItemCode';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ItemDescription; Rec.ItemDescription)
                {
                    Caption = 'ItemDescription';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(KichOrderQuantity; Rec.KichOrderQuantity)
                {
                    Caption = 'Order Quantity';
                    ApplicationArea = All;
                }
                field(KichProducedQuantityTotal; Rec."KichProducedQuantityTotal")
                {
                    Caption = 'KichProducedQuantityTotal';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BMProducedQuantityTotal; Rec."BMProducedQuantityTotal")
                {
                    Caption = 'BMProducedQuantityTotal';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BMOrdBalanceQuantity; Rec."BMOrdBalanceQuantity")
                {
                    Caption = 'BMOrdBalanceQuantity';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(KichOrdDueDate; Rec."KichOrdDueDate")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdDueDate';
                    Editable = false;
                }
                field(KichOrdStatus; Rec."KichOrdStatus")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdStatus';
                    Editable = false;
                }
                field(ItemImage; GetBase64Image())
                {
                    Caption = 'ItemImage';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    local procedure GetBase64Image(): Text
    var
        Item: Record Item;
        TenantMedia: Record "Tenant Media";
        Base64: Codeunit "Base64 Convert";
        InStream: InStream;
        PictureId: Guid;
    begin
        if Rec."ItemCode" = '' then exit('');

        if Item.Get(Rec."ItemCode") then
            if Item.Picture.Count > 0 then begin
                PictureId := Item.Picture.Item(1);
                if TenantMedia.Get(PictureId) then begin
                    TenantMedia.CalcFields(Content);
                    if TenantMedia.Content.HasValue() then begin
                        TenantMedia.Content.CreateInStream(InStream);
                        exit(Base64.ToBase64(InStream));
                    end;
                end;
            end;

        exit('');
    end;
}