page 50177 "BM Prod Recording Header"
{
    APIGroup = 'ProductionAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'BM Production Recording Header';
    DelayedInsert = true;
    EntityName = 'BMProductionRecording';
    EntitySetName = 'BMProductionRecordings';
    PageType = API;
    SourceTable = "KichProdOrderHeader";
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
                }
                field(itemNo; Rec."ItemCode")
                {
                    Caption = 'Item No.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(product; Rec.ItemDescription)
                {
                    Caption = 'Product';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(assemblyQuantity; Rec.AssemblyQuantity)
                {
                    Caption = 'Assembly Quantity';
                    ApplicationArea = All;
                }
                field(orderQuantity; Rec.KichOrderQuantity)
                {
                    Caption = 'Order Quantity';
                    ApplicationArea = All;
                }
                field(prodLogTotal; Rec."KichProducedQuantityTotal")
                {
                    Caption = 'Production Log Total';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(prodLogBalance; Rec."KichOrdBalanceQuantity")
                {
                    Caption = 'Production Log Balance';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(base64Image; GetBase64Image())
                {
                    Caption = 'Item Image (Base64)';
                    ApplicationArea = All;
                    Editable = false;
                }

                //  part(Lines; "Production Recording Line API")
                //  {
                //      Caption = 'Production Lines';
                //      EntityName = 'ProductionRecordingLine';
                //      EntitySetName = 'ProductionRecordingLines';
                //      SubPageLink = "Assembly Order No" = field("Assembly Order No");
                //  }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // Calculate totals when record is retrieved
        // Rec.UpdateProdLogTotals();
    end;

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