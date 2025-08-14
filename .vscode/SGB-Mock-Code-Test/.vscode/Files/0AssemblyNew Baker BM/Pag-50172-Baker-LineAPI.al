page 50172 "BM Recording Line API"
{
    APIGroup = 'ProductionAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'BM Recording Line API';
    DelayedInsert = true;
    EntityName = 'BMRecordingLine';
    EntitySetName = 'BMRecordingLines';
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
            }
        }
    }
}