codeunit 50110 "Item Media Handler"
{
    procedure GetItemImageUrl(ItemNo: Code[20]): Text
    var
        Item: Record Item;
        MediaID: Guid;
    begin
        if not Item.Get(ItemNo) then exit('');
        if Item.Picture.Count = 0 then exit('');
        
        MediaID := Item.Picture.Item(1);
        exit(GetImageUrl(MediaID));
    end;

    local procedure GetImageUrl(MediaID: Guid): Text
    var
        BaseUrl: Text;
    begin
        BaseUrl := GetBaseUrl();
        exit(StrSubstNo('%1Web/DownloadMedia.ashx?mediaid=%2&sessionless=1', BaseUrl, MediaID));
    end;

    local procedure GetBaseUrl(): Text
    var
        Url: Text;
    begin
        Url := GetUrl(CLIENTTYPE::ODataV4, '', OBJECTTYPE::Page, 0);
        if not Url.EndsWith('/') then Url += '/';
        exit(Url);
    end;
}