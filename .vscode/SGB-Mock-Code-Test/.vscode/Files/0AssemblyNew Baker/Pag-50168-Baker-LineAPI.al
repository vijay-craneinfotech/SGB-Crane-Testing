page 50168 "Baker Recording Line API"
{
    APIGroup = 'ProductionAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'Baker Recording Line API';
    DelayedInsert = true;
    EntityName = 'BakerRecordingLine';
    EntitySetName = 'BakerRecordingLines';
    PageType = API;
    SourceTable = "Baker Recording Part";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(assemblyOrderNo; Rec."Assembly Order No")
                {
                    Caption = 'Assembly Order No';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(producedQty; Rec."Produce Quantity")
                {
                    Caption = 'Produced Quantity';
                    ApplicationArea = All;
                }
                field(productionDateTime; Rec."Production DateTime")
                {
                    Caption = 'Production Date/Time';
                    ApplicationArea = All;
                }
                field(manufacturingDate; Rec."Manufacturing Date")
                {
                    Caption = 'Manufacturing Date';
                    ApplicationArea = All;
                }
                field(expiryDate; Rec."Expiry Date")
                {
                    Caption = 'Expiry Date';
                    ApplicationArea = All;
                }
                field(ReferenceLineNo ; Rec."Reference Line No")
                {
                    Caption = 'Reference Line No';
                    ApplicationArea = All;
                }
            }
        }
    }
}