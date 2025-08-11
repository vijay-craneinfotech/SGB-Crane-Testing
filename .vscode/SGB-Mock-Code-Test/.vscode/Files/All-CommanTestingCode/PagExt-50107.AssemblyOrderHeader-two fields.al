pageextension 50116 "Assembly Order Ext" extends "Assembly Order"
{
    layout
    {
        addafter(Description)
        {
            field("Kitchen Section Code"; Rec."Kitchen Section Code")
            {
                ApplicationArea = All;
                ToolTip = 'Automatically populated from the Item Master';
            }
            field("Kitchen Section Description"; Rec."Kitchen Section Description")
            {
                ApplicationArea = All;
                ToolTip = 'Automatically populated from the Kitchen Section Master';
            }
        }
    }
    
    trigger OnAfterGetRecord()
    begin
        UpdateKitchenSectionFields();
    end;

    local procedure UpdateKitchenSectionFields()
    var
        Item: Record Item;
    begin
        if Rec."Item No." <> '' then begin
            if Item.Get(Rec."Item No.") then begin
                Rec."Kitchen Section Code" := Item."Kitchen Section";
                // Description is automatically updated via FlowField
            end;
        end else begin
            Rec."Kitchen Section Code" := '';
        end;
    end;
}