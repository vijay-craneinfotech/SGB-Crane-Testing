page 70333 "BakerProdOrderLines"   
{
    PageType = API;
    APIGroup = 'ProductionAPI';            //used for post
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'BakerProdOrderLines';
    DelayedInsert = true;
    EntityName = 'BakerProdOrderLine';        //BakerProdOrderLine
    EntitySetName = 'BakerProdOrderLines';       //BakerProdOrderLines
    SourceTable = "BakerProdOrderLines";      //BakerProdOrderLines= table name


    //KichOrderNumber
    //KichOrdLineNo
    //ItemCode
    //ItemDescription
    //ItemImage
    //KichProducedQuantity
    //KichOrdDueDate
    //KichOrdStatus -- Hold, Pending, WIP
    //UserName
    //Date_Time
    //ManufacturingDate
    //ExpiryDate
    //BatchNo

    //BakOrdBalanceQuantity
    //BakProducedQuantity

    //BMOrdBalanceQuantity
    //BMProducedQuantity

    //QCOrdBalanceQuantity
    //QCProducedQuantity

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
                    Editable = false;
                }
                field(KichOrdLineNo; Rec."KichOrdLineNo")
                {
                    Caption = 'KichOrdLineNo';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BakerProducedQuantity; Rec."BakerProducedQuantity")
                {
                    Caption = 'BakerProducedQuantity';
                    ApplicationArea = All;
                }
                field("UserName"; Rec."UserName")
                {
                    ApplicationArea = All;
                    Caption = 'UserName';
                }
                field("ItemCode"; Rec."ItemCode")
                {
                    ApplicationArea = All;
                    Caption = 'ItemCode';
                    //Editable = false;
                }
                field("ItemDescription"; Rec.ItemDescription)
                {
                    ApplicationArea = All;
                    Caption = 'ItemDescription';
                    Editable = false;
                }
                field("BakerOrdStatus"; Rec."BakerOrdStatus")
                {
                    ApplicationArea = All;
                    Caption = 'BakerOrdStatus';
                }
                field(BMProducedQuantity; Rec."BMProducedQuantity")
                {
                    Caption = 'BakProducedQuantity';
                    ApplicationArea = All;
                }
                field(BMOrdBalanceQuantity; Rec."BMOrdBalanceQuantity")
                {
                    Caption = 'BMOrdBalanceQuantity';
                    ApplicationArea = All;
                }
                field("KichOrdDueDate"; Rec."KichOrdDueDate")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdDueDate';
                }
                field(DateTime; Rec."DateTime")
                {
                    Caption = 'DateTime';
                    ApplicationArea = All;
                }
                field(ManufacturingDate; Rec."ManufacturingDate")
                {
                    Caption = 'ManufacturingDate';
                    ApplicationArea = All;
                }
                field(ExpiryDate; Rec."ExpiryDate")
                {
                    Caption = 'ExpiryDate';
                    ApplicationArea = All;
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