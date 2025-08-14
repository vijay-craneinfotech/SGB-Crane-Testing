tableextension 50105 "Item Ext" extends Item
{
    fields
    {
        field(50100; "Kitchen Section"; Code[20])
        {
            Caption = 'Kitchen Section';
            TableRelation = "Kitchen Section Master";
            DataClassification = CustomerContent;
        }
        field(50101; "Item Usage Type"; Enum "Item Usage Type")
        {
            Caption = 'Item Usage Type';
            DataClassification = CustomerContent;
        }
        field(50149; "URL"; Text[250])
        {
            Caption = 'URL';
            ExtendedDatatype = URL;
            DataClassification = CustomerContent;
        }
    }
}