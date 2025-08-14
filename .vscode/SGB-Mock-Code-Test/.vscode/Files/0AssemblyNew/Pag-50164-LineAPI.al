page 50164 "Production Recording Line"
{
    APIGroup = 'ProductionAPI';
    APIPublisher = 'VJ';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'Production Recording Line API';
    DelayedInsert = true;
    EntityName = 'ProductionRecordingLine';
    EntitySetName = 'ProductionRecordingLines';
    PageType = API;
    SourceTable = "Production Recording Part1";
    
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

//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     begin
//         // Auto-generate line number if not provided
//         if Rec."Line No." = 0 then begin
//             Rec.SetAutoCalcFields("Line No.");
//             Rec."Line No." := GetNextLineNo(Rec."Assembly Order No");
//         end;
//     end;

//     local procedure GetNextLineNo(AssemblyOrderNo: Code[20]): Integer
//     var
//         Line: Record "Production Recording Part1";
//     begin
//         Line.SetRange("Assembly Order No", AssemblyOrderNo);
//         if Line.FindLast() then
//             exit(Line."Line No." + 10000);
//         exit(10000);
//     end;
}