pageextension 50108 "Manufacturing Setup Page Ext" extends "Manufacturing Setup"
{
    layout
    {
        addlast(General)
        {
            field("AslyProdTran No. Series"; Rec."AslyProdTran No. Series")
            {
                ApplicationArea = All;
            }
        }
    }
}