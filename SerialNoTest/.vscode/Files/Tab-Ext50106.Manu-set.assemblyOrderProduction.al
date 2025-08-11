tableextension 50106 "Manufacturing Setup Ext" extends "Manufacturing Setup"
{
    fields
    {
        field(50106; "AslyProdTran No. Series"; Code[20])
        {
            Caption = 'Assembly Production Transaction No. Series';
            TableRelation = "No. Series";
        }
    }
}