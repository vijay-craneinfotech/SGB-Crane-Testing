page 50141 "Assembly Line Subpart"  // it gives correct Get response with header page
{
    PageType = API;
    EntitySetName = 'AssemblyOrderLines';
    EntityName = 'AssemblyOrderLine';
    SourceTable = "Assembly Line";
    Caption = 'Assembly Line Subpart';
    APIVersion = 'v1.0';
    APIGroup = 'AssemblyOrderAPI';
    APIPublisher = 'VJ';
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(quantityPer; Rec."Quantity per")
                {
                    Caption = 'Quantity per';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
            }
        }
    }
}
