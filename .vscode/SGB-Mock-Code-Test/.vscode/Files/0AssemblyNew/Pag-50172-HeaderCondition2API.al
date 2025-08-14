page 50173 "Baker Production Recording"
{
    APIGroup = 'ProductionAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'Baker Production Recording Header';
    DelayedInsert = true;
    EntityName = 'BakerProductionRecording';
    EntitySetName = 'BakerProductionRecordings';
    PageType = API;
    SourceTable = "Production Recording Header";
    SourceTableView = where("Baker Offred Balance" = filter(> 0));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(assemblyOrderNo; Rec."Assembly Order No")
                {
                    Caption = 'Assembly Order No';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(product; Rec.Product)
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
                field(orderQuantity; Rec.OrderQuantity)
                {
                    Caption = 'Order Quantity';
                    ApplicationArea = All;
                }
                field(prodLogTotal; Rec."Prod Offred Total")
                {
                    Caption = 'Production Log Total';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(prodLogBalance; Rec."Prod Offred Balance")
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
        if Rec."Item No." = '' then exit('');

        if Item.Get(Rec."Item No.") then
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