page 50140 "Assembly Data"   //this is working correct- https://api.businesscentral.dynamics.com/v2.0/f52861fd-85c4-4b16-b6a6-8b08b1901613/Sandbox/ODataV4/Company('CRONUS%20IN')/AssemblyOrder(documentType='Order',no='A00006')?$expand=AssemblyOrderLines
{                            // it gives correct Get response service name= AssemblyOrder
    APIGroup = 'AssemblyOrderAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'assemblyOrderAPI';
    DelayedInsert = true;
    EntityName = 'AssemblyOrder';
    EntitySetName = 'AssemblyOrder';
    PageType = API;
    SourceTable = "Assembly Header";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                    ApplicationArea = All;
                }
                field(quantityToAssemble; Rec."Quantity to Assemble")
                {
                    Caption = 'Quantity to Assemble';
                    ApplicationArea = All;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                    ApplicationArea = All;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ApplicationArea = All;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                    ApplicationArea = All;
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                    ApplicationArea = All;
                }
                field(remainingQuantity; Rec."Remaining Quantity")
                {
                    Caption = 'Remaining Quantity';
                    ApplicationArea = All;
                }
                field(assembledQuantity; Rec."Assembled Quantity")
                {
                    Caption = 'Assembled Quantity';
                    ApplicationArea = All;
                }
                field(assembleToOrder; Rec."Assemble to Order")
                {
                    Caption = 'Assemble to Order';
                    ApplicationArea = All;
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = All;
                }
                field(base64Image; GetBase64Image())
                {
                    Caption = 'Image Base64';
                    ApplicationArea = All;
                    Editable = false;
                }
                
                part(Lines; "Assembly Line Subpart")
                {
                    Caption = 'Lines';
                    EntityName = 'AssemblyOrderLine';
                    EntitySetName = 'AssemblyOrderLines';
                    SubPageLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                }
            }
        }
    }

    local procedure GetBase64Image(): Text
    var
        Item: Record Item;
        TenantMedia: Record "Tenant Media";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        Base64: Codeunit "Base64 Convert";
        PictureId: Guid;
    begin
        // Check if Item No. exists in Assembly Header
        if Rec."Item No." <> '' then begin
            // Retrieve the Item record based on Item No.
            if Item.Get(Rec."Item No.") then begin
                // Check if Picture field in Item has media
                if Item.Picture.Count > 0 then begin
                    // Get the first media ID from the MediaSet
                    PictureId := Item.Picture.Item(1);
                    // Retrieve the media from Tenant Media table
                    if TenantMedia.Get(PictureId) then begin
                        TenantMedia.CalcFields(Content);
                        if TenantMedia.Content.HasValue then begin
                            // Read media content into InStream
                            TenantMedia.Content.CreateInStream(InStream);
                            // Convert to Base64
                            exit(Base64.ToBase64(InStream));
                        end;
                    end;
                end;
            end;
        end;
        // Return empty string if no image or item not found
        exit('');
    end;
}