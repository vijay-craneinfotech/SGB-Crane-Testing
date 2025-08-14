// Item Card Page Extension
pageextension 50106 "Item Card Serial No. Actions" extends "Item Card"
{
    layout
    {
        addlast(InventoryGrp)
        {
            group(KitchenSection)
            {
                Caption = 'Kitchen Section';
                field("Kitchen Section"; Rec."Kitchen Section")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select kitchen section from master list';
                    
                    trigger OnValidate()
                    var
                        KitchenSection: Record "Kitchen Section Master";
                    begin
                        if Rec."Kitchen Section" <> '' then
                            if not KitchenSection.Get(Rec."Kitchen Section") then
                                Error('Kitchen section %1 does not exist', Rec."Kitchen Section");
                    end;
                }
            }
        }
        
        addlast(Item)
        {
            field("Item Usage Type"; Rec."Item Usage Type")
            {
                ApplicationArea = All;
                ToolTip = 'Select how this item is primarily used';
            }
            field(URL; Rec.URL)
            {
                ApplicationArea = All;
                ShowMandatory = true;
                ToolTip = 'Specifies the web address for this item';
                
            }
        }
    }


    
    actions
    {
        addlast(RequestApproval)
        {
            action(AssignSerialNo)
            {
                ApplicationArea = ItemTracking;
                Caption = 'Assign Serial No.';
                ToolTip = 'Generate serial numbers using the item''s number series';
                Image = SerialNo;

                trigger OnAction()
                var
                    EnterQtyToCreate: Page "Enter Quantity to Create";
                    Qty: Integer;
                    CreateNewLot: Boolean;
                    CreateNewPackage: Boolean;
                    CreateSNInfo: Boolean;
                    SerialNoCreator: Codeunit "Item Serial Number Creation";
                    VariantCode: Code[10];
                    CreatedCount: Integer;
                begin
                    if Rec."Item Tracking Code" = '' then
                        Error('Item Tracking Code is not set for item %1.', Rec."No.");
                        
                    VariantCode := GetSerialNoVariantCode();
                    EnterQtyToCreate.SetFields(Rec."No.", VariantCode, 1, true, true, true);
                    if EnterQtyToCreate.RunModal() = ACTION::OK then begin
                        EnterQtyToCreate.GetFields(Qty, CreateNewLot, CreateNewPackage, CreateSNInfo);
                        CreatedCount := SerialNoCreator.CreateSerialNumbersByQuantity(Rec."No.", VariantCode, Qty);
                        ShowConfirmationAndOpenList(CreatedCount, Rec."No.", VariantCode);
                    end;
                end;
            }
            action(CreateCustomizedSN)
            {
                ApplicationArea = ItemTracking;
                Caption = 'Create Customized SN';
                ToolTip = 'Create serial numbers with a custom format';
                Image = SerialNo;

                trigger OnAction()
                var
                    EnterCustomizedSN: Page "Enter Customized SN";
                    Qty: Integer;
                    CreateNewLot: Boolean;
                    CreateNewPackage: Boolean;
                    CreateSNInfo: Boolean;
                    CustomizedSN: Code[50];
                    Increment: Integer;
                    SerialNoCreator: Codeunit "Item Serial Number Creation";
                    VariantCode: Code[10];
                    CreatedCount: Integer;
                begin
                    if Rec."Item Tracking Code" = '' then
                        Error('Item Tracking Code is not set for item %1.', Rec."No.");
                        
                    VariantCode := GetSerialNoVariantCode();
                    EnterCustomizedSN.SetFields(Rec."No.", VariantCode, 1, true, true, true);
                    if EnterCustomizedSN.RunModal() = ACTION::OK then begin
                        EnterCustomizedSN.GetFields(Qty, CreateNewLot, CreateNewPackage, CustomizedSN, Increment, CreateSNInfo);
                        CreatedCount := SerialNoCreator.CreateCustomSerialNumbers(
                            Rec."No.", VariantCode, CustomizedSN, Increment, Qty);
                        ShowConfirmationAndOpenList(CreatedCount, Rec."No.", VariantCode);
                    end;
                end;
            }
        }
    }

    local procedure GetSerialNoVariantCode(): Code[10]
    var
        VariantFilter: Text;
    begin
        if Rec."Variant Filter" = '' then
            exit('');

        VariantFilter := Rec."Variant Filter";
        if (StrPos(VariantFilter, '|') > 0) or 
           (StrPos(VariantFilter, '&') > 0) or 
           (StrPos(VariantFilter, '<') > 0) or 
           (StrPos(VariantFilter, '>') > 0) or 
           (StrPos(VariantFilter, '..') > 0) then
            exit('');

        exit(CopyStr(Rec."Variant Filter", 1, MaxStrLen(Rec."Variant Filter")));
    end;

    local procedure ShowConfirmationAndOpenList(CreatedCount: Integer; ItemNo: Code[20]; VariantCode: Code[10])
    var
        SerialNoInformation: Record "Serial No. Information";
        SerialNoInformationList: Page "Serial No. Information List";
    begin
        if CreatedCount = 0 then
            exit;
            
        if Confirm(StrSubstNo('%1 serial numbers created successfully.\\Do you want to open the Serial No. Information List?', CreatedCount), true) then begin
            SerialNoInformation.Reset();
            SerialNoInformation.SetRange("Item No.", ItemNo);
            if VariantCode <> '' then
                SerialNoInformation.SetRange("Variant Code", VariantCode);
            SerialNoInformationList.SetTableView(SerialNoInformation);
            SerialNoInformationList.Run();
        end;
    end;
}

