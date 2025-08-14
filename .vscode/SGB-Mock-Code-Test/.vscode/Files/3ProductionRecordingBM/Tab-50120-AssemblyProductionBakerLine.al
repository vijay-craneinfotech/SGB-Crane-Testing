// table 50156 "Assembly Production part BM"
// {
//     DataClassification = CustomerContent;
//     Caption = 'Assembly Production Recording';

//     fields
//     {
//         field(1; "Assembly Order No."; Code[20])
//         {
//             Caption = 'Assembly Order No.';
//             TableRelation = "Assembly Header"."No.";
//         }
//         field(2; "Item Code"; Code[20])
//         {
//             Caption = 'Item Code';
//             TableRelation = Item."No.";
//         }
//         field(3; "Line No."; Integer)
//         {
//             Caption = 'Assembly Order Line No.';
//         }
//         field(4; "Produced Qty."; Decimal)
//         {
//             Caption = 'Produced Quantity';
//         }
//         field(5; "Warehouse Code"; Code[10])
//         {
//             Caption = 'From Warehouse';
//             TableRelation = Location.Code;
//         }
//         field(6; "Next Warehouse Code"; Code[10])
//         {
//             Caption = 'To Warehouse';
//             TableRelation = Location.Code;
//         }
        
//         field(8; "BPF Stage"; Code[20])
//         {
//             Caption = 'BPF Stage';
//         }
//         field(9; "Action Note 1"; Text[50])
//         {
//             Caption = 'Action Note 1';
//         }
//         field(10; "Action Note 2"; Text[50])
//         {
//             Caption = 'Action Note 2';
//         }
//         field(11; "Action Note 3"; Text[50])
//         {
//             Caption = 'Action Note 3';
//         }
//         field(14; "Production DateTime"; DateTime)
//         {
//             Caption = 'Production Date/Time';
//         }
//         field(16; "Prod Record User"; Code[20])
//         {
//             Caption = 'Production Recorder';
//             TableRelation = Employee."No.";
//         }
//         field(17; "Baker Record DateTime"; DateTime)
//         {
//             Caption = 'Baker Record Date/Time';
//         }
//         field(18; "Baker User"; Code[20])
//         {
//             Caption = 'Baker User';
//             TableRelation = Employee."No.";
//         }
//         field(22; "Transfer Required"; Boolean)
//         {
//             Caption = 'Transfer Required';
//         }
//         field(23; "Shift"; Text[50])
//         {
//             Caption = 'Shift';
//             DataClassification = CustomerContent;
//         }
//         field(24; "Staff"; Text[50])
//         {
//             Caption = 'Staff';
//             DataClassification = CustomerContent;
//         }
//         field(25; "Kitchen"; Text[50])
//         {
//             Caption = 'Kitchen';
//             DataClassification = CustomerContent;
//         }
//         field(26; "Oven"; Text[50])
//         {
//             Caption = 'Oven';
//             DataClassification = CustomerContent;
//         }
//         field(27; "Temperature"; Text[20])
//         {
//             Caption = 'Temperature';
//             DataClassification = CustomerContent;
//         }
//         field(28; "Duration"; Text[20])
//         {
//             Caption = 'Duration';
//             DataClassification = CustomerContent;
//         }
//         field(29; "Status"; Enum "Assembly pro status")
//         {
//             Caption = 'Status';
//             DataClassification = CustomerContent;
//         }
//         field(30; "Manufacturing Date"; Date)
//         {
//             Caption = 'Manufacturing Date';
//             DataClassification = CustomerContent;
//         }
//         field(31; "Expiry Date"; Date)
//         {
//             Caption = 'Expiry Date';
//             DataClassification = CustomerContent;
//         }
//     }

//     keys
//     {
//         key(PK; "Assembly Order No.", "Line No.")
//         {
//             Clustered = true;
//         }
//     }

//     trigger OnInsert()
//     var
//         LastLine: Record "Assembly Production part BM";
//     begin
//         // Auto-increment Line No. (10000, 20000, 30000...)
//         LastLine.SetRange("Assembly Order No.", "Assembly Order No.");
//         if LastLine.FindLast() then
//             "Line No." := LastLine."Line No." + 10000
//         else
//             "Line No." := 10000;

//         // Set default date/time
//         if "Production DateTime" = 0DT then
//             "Production DateTime" := CurrentDateTime();
            
//         UpdateProductionOrderTotals();
//     end;

//     trigger OnModify()
//     begin
//         if "Production DateTime" = 0DT then
//             "Production DateTime" := CurrentDateTime();
//         UpdateProductionOrderTotals();
//     end;

//     trigger OnDelete()
//     begin
//         UpdateProductionOrderTotals();
//     end;

//     local procedure UpdateProductionOrderTotals()
//     var
//         AssemblyOrder: Record "AssemblyProductionOrderHeader";
//     begin
//         if AssemblyOrder.Get(Rec."Assembly Order No.") then begin
//             AssemblyOrder.CalcFields("Total Produced Qty.", "Offered to Baker Qty.");
//            // AssemblyOrder."Balance Quantity" := AssemblyOrder.OrderQuantity - AssemblyOrder."Total Produced Qty.";
//            AssemblyOrder.Validate("Balance Quantity" ,( AssemblyOrder.OrderQuantity - AssemblyOrder."Total Produced Qty."));
//             AssemblyOrder.Modify(true);
//         end;
//     end;
// }