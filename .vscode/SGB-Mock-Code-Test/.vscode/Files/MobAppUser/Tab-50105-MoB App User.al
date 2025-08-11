table 50105 "Mob App User"
{
    DataClassification = CustomerContent;
    Caption = 'Mobile App User';

    fields
    {
        field(1; "User ID"; Code[20])
        {
            Caption = 'User ID';
            NotBlank = true;
            DataClassification = EndUserIdentifiableInformation;
        }
        field(2; "User Name"; Text[100])
        {
            Caption = 'User Name';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(3; Pwd; Text[128])
        {
            Caption = 'Password';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(4; "Email ID"; Text[80])
        {
            Caption = 'Email ID';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(5; "User Field of BC"; Code[50])
        {
            Caption = 'User Field of BC';
            TableRelation = User."User Name";
            DataClassification = EndUserIdentifiableInformation;
        }
        field(6; Status; Enum "Status")
        {
            Caption = 'Status';
        }
        field(7; "Reset Pwd Token"; Text[128])
        {
            Caption = 'Reset Pwd Token';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(8; "Type of User"; Enum "AppUserType")
        {
            Caption = 'Type of User';
            // OptionMembers = Kitchen,Baker,BakeryManager,QCManager,DeliveryDriver,Security;
            // OptionCaption = 'Kitchen,Baker,Bakery Manager,QC Manager,Delivery Driver,Security';
        }
    }

    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
    }
}