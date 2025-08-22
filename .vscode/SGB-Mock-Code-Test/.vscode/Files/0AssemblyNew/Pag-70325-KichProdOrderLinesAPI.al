page 70325 "KichProdOrderLines"   //KichProdOrderLines
{
    PageType = API;
    APIGroup = 'ProductionAPI';            //used for post
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'KichProdOrderLines';
    DelayedInsert = true;
    EntityName = 'KichProdOrderLine';        //KichProdOrderLine
    EntitySetName = 'KichProdOrderLines';       //KichProdOrderLines
    SourceTable = "KichProdOrderLines";      //KichProdOrderLines= table name


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
                field(KichProducedQuantity; Rec."KichProducedQuantity")
                {
                    Caption = 'KichProducedQuantity';
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
                field("KichOrdStatus"; Rec."KichOrdStatus")
                {
                    ApplicationArea = All;
                    Caption = 'KichOrdStatus';
                }
                field(BakProducedQuantity; Rec."BakProducedQuantity")
                {
                    Caption = 'BakProducedQuantity';
                    ApplicationArea = All;
                }
                field(BakOrdBalanceQuantity; Rec."BakOrdBalanceQuantity")
                {
                    Caption = 'BakOrdBalanceQuantity';
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