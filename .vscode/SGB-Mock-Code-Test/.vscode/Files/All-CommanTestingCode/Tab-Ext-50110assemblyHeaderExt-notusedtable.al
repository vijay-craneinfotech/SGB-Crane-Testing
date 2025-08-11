tableextension 50110 "Assembly Header Ext" extends "Assembly Header"
{
    fields
    {
        field(50100; "Kitchen Section Code"; Code[20])
        {
            Caption = 'Kitchen Section Code';
            TableRelation = "Kitchen Section Master";
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Kitchen Section" where("No." = field("Item No.")));
        }
        field(50101; "Kitchen Section Description"; Text[100])
        {
            Caption = 'Kitchen Section Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Kitchen Section Master".Description where(Code = field("Kitchen Section Code")));
        }
    }
}