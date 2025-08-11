page 50114 "Item Master API"
{
    PageType = API;
    SourceTable = Item;
    APIPublisher = 'custom';
    APIGroup = 'itemmaster';
    APIVersion = 'v1.0';
    EntityName = 'item';
    EntitySetName = 'items';
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(itemNo; Rec."No.") 
                {
                    Caption = 'itemNo';
                }
                field(description; Rec.Description) 
                {
                    Caption = 'description';
                }
                field(baseUnitOfMeasure; Rec."Base Unit of Measure") 
                {
                    Caption = 'baseUnitOfMeasure';
                }
                field(imageUrl; GetImageUrl()) 
                {
                    Caption = 'imageUrl';
                }
            }
        }
    }

    local procedure GetImageUrl(): Text
    var
        TenantMedia: Record "Tenant Media";
        MediaID: Guid;
    begin
        if Rec.Picture.Count > 0 then begin
            MediaID := Rec.Picture.Item(1);
            if TenantMedia.Get(MediaID) then
                exit(GetMediaUrl(MediaID));
        end;
        exit('');
    end;

    local procedure GetMediaUrl(MediaID: Guid): Text
    var
        CompanyName: Text;
    begin
        CompanyName := Format(Rec.CurrentCompany);
        exit(StrSubstNo(
            '%1/api/v2.0/companies(%2)/tenantMedia(%3)/content',
            GetBaseUrl(),
            CompanyName,
            MediaID));
    end;

    local procedure GetBaseUrl(): Text
    begin
        exit(GetUrl(CLIENTTYPE::ODataV4, '', OBJECTTYPE::Page, 0));
    end;
}