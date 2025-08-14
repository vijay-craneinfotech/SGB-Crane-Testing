
page 50139 "Item API"              //it returns image data with Base64 encoding correct
{
    PageType = API;
    SourceTable = Item;
    APIPublisher = 'mycompany';
    APIGroup = 'inventory';
    APIVersion = 'v1.0';
    EntityName = 'itemWithImage';
    EntitySetName = 'itemsWithImage';
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(itemNo; Rec."No.")
                {
                    Caption = 'Item No';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }
                field(base64Image; GetBase64Image())
                {
                    Caption = 'Image Base64';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    local procedure GetBase64Image(): Text
    var
        TenantMedia: Record "Tenant Media";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        Base64: Codeunit "Base64 Convert";
        PictureId: Guid;
    begin
        // Check if Picture field has media
        if Rec.Picture.Count > 0 then begin
            // Get the first media ID from the MediaSet
            PictureId := Rec.Picture.Item(1);
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
        // Return empty string if no image
        exit('');
    end;
}