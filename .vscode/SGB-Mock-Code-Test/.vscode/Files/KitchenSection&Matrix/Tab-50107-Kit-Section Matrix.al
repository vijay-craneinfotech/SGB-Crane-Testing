table 50107 "Kit-Section Matrix"
{
    DataClassification = CustomerContent;
    Caption = 'Kit-Section Matrix';

    fields
    {
        field(1; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = "Mob App User"."User ID";
        }
        field(2; "Section Code"; Code[20])
        {
            Caption = 'Production Section Code';
            TableRelation = "Kitchen Section Master".Code;
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
        field(4; "User Name"; Text[100])
        {
            Caption = 'User Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Mob App User"."User Name" where("User ID" = field("User ID")));
            Editable = false;
        }
        field(5; "Section Description"; Text[100])
        {
            Caption = 'Section Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Kitchen Section Master".Description where(Code = field("Section Code")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "User ID", "Section Code")
        {
            Clustered = true;
        }
    }
}