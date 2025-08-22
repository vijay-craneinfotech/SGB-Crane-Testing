page 70335 "BakerOrderLineDisplay"   //this is working correct- https://api.businesscentral.dynamics.com/v2.0/f52861fd-85c4-4b16-b6a6-8b08b1901613/Sandbox/ODataV4/Company('CRONUS%20IN')/AssemblyOrder(documentType='Order',no='A00006')?$expand=AssemblyOrderLines
{                                         //it gives correct Get response service name= KichOrderHeaderLines
    PageType = API;
    APIGroup = 'AssemblyOrderAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'BakerOrderLineDisplay';
    DelayedInsert = true;
    EntityName = 'BakerOrderLineDisplay';
    EntitySetName = 'BakerOrderLineDisplays';
    SourceTable = "KichProdOrderHeader";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(KichOrderNumber; Rec."KichOrderNumber")
                {
                    Caption = 'KichOrderNumber';
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
                field(AssemblyQuantity; Rec.AssemblyQuantity)
                {
                    Caption = 'AssemblyQuantity';
                    ApplicationArea = All;
                }
                field(KichOrderQuantity; Rec.KichOrderQuantity)
                {
                    Caption = 'KichOrderQuantity';
                    ApplicationArea = All;
                }
                field(KichProducedQuantityTotal; Rec."KichProducedQuantityTotal")
                {
                    Caption = 'KichProducedQuantityTotal';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BakProducedQuantityTotal; Rec."BakProducedQuantityTotal")
                {
                    Caption = 'BakProducedQuantityTotal';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BakOrdBalanceQuantity; Rec."BakOrdBalanceQuantity")
                {
                    Caption = 'BakOrdBalanceQuantity';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(KichOrdStatus; Rec."KichOrdStatus")
                {
                    Caption = 'KichOrdStatus';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ItemImage; GetBase64Image())
                {
                    Caption = 'ItemImage';
                    ApplicationArea = All;
                    Editable = false;
                }
                part(Lines; "BakerOrderDisplayPart")
                {
                    SubPageLink = "KichOrderNumber" = field("KichOrderNumber");
                }
            }
        }
    }

    local procedure GetBase64Image(): Text
    var
        Item: Record Item;
        TenantMedia: Record "Tenant Media";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        Base64: Codeunit "Base64 Convert";
        PictureId: Guid;
    begin
        // Check if Item No. exists in Assembly Header
        if Rec."ItemCode" <> '' then begin
            // Retrieve the Item record based on Item No.
            if Item.Get(Rec."ItemCode") then begin
                // Check if Picture field in Item has media
                if Item.Picture.Count > 0 then begin
                    // Get the first media ID from the MediaSet
                    PictureId := Item.Picture.Item(1);
                    // Retrieve the media from Tenant Media table
                    if TenantMedia.Get(PictureId) then begin
                        TenantMedia.CalcFields(Content);
                        if TenantMedia.Content.HasValue then begin
                            // Read media content into InStream
                            TenantMedia.Content.CreateInStream(InStream);
                            // Convert to Base64
                            exit(Base64.ToBase64(InStream));
                        end;
                    end;
                end;
            end;
        end;
        // Return empty string if no image or item not found
        exit('');
    end;
}