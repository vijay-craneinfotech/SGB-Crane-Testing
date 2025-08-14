
page 50136 "Item Image API"   //for 
{
    APIGroup = 'custom';
    APIPublisher = 'SGBVJ';
    APIVersion = 'v2.0'; // Align with standard API v2.0
    Caption = 'Item Image API';
    EntityName = 'itemImage';
    EntitySetName = 'itemImages';
    PageType = API;
    SourceTable = Item;
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
                field(pictureId; PictureId)
                {
                    Caption = 'Picture Id';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(pictureUrl; PictureUrl)
                {
                    Caption = 'Picture URL';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(IMGURL; Rec.URL)
                {
                    Caption = 'Item Master Picture URL';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the web address for this item master picture';
                }
            }
        }
    }

    var
        PictureId: Guid;
        PictureUrl: Text;

    trigger OnAfterGetRecord()
    var
        TenantMedia: Record "Tenant Media";
        BaseUrl: Text;
        CompanyId: Guid;
    begin
        // Initialize picture fields
        PictureId := '00000000-0000-0000-0000-000000000000';
        PictureUrl := '';

        // Get company ID
        CompanyId := GetCompanyId();

        // Check if picture exists
        if Rec.Picture.Count > 0 then begin
            PictureId := Rec.Picture.Item(1);
            if TenantMedia.Get(PictureId) then begin
                TenantMedia.CalcFields(Content);
                if TenantMedia.Content.HasValue then begin
                    // Construct correct picture URL using standard API v2.0 endpoint
                    BaseUrl := 'https://api.businesscentral.dynamics.com/v2.0/%1/%2/api/v2.0';
                    PictureUrl := StrSubstNo(
                        BaseUrl + '/companies(%3)/items(%4)/picture(%5)/pictureContent',
                        GetTenantId(),
                        GetEnvironment(),
                        CompanyId,
                        Rec.SystemId,
                        PictureId
                    );
                end;
            end;
        end;
    end;

    local procedure GetCompanyId(): Guid
    var
        Company: Record Company;
    begin
        if not Company.Get(CompanyName()) then
            Error('Company %1 not found.', CompanyName());
        exit(Company.SystemId);
    end;

    local procedure GetTenantId(): Text
    begin
        // Replace with your actual tenant ID
        exit('f52861fd-85c4-4b16-b6a6-8b08b1901613');
    end;

    local procedure GetEnvironment(): Text
    begin
        // Replace with your actual environment (e.g., 'Sandbox' or 'Production')
        exit('Sandbox');
    end;
}