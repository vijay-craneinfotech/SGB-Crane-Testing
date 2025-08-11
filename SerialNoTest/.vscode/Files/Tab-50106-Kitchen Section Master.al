table 50106 "Kitchen Section Master"
{
    DataClassification = CustomerContent;
    Caption = 'Kitchen Section Master';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Status; Enum "Status")
        {
            Caption = 'Status';
        }
        //    field(3; "Status"; Option)
        //    {
        //        Caption = 'Status';
        //        OptionMembers = Active,Inactive;
        //        OptionCaption = 'Active,Inactive';
        //    }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}