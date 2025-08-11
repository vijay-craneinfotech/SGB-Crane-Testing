page 50101 "Assembly Line API"
{
    APIGroup = 'AssemblyOrderLineAPI';
    APIPublisher = 'AssemblyOrderLineAPI';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'assemblyOrderLineAPIPage';
    DelayedInsert = true;
    EntityName = 'AssemblyOrderLineAPI';
    EntitySetName = 'AssemblyOrderLineAPI';
    PageType = API;
    SourceTable = "Assembly Line";
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
                field("type"; Rec."Type")
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