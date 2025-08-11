// table 50108 "Assembly Production Recording"
// {
//     DataClassification = CustomerContent;
//     Caption = 'Assembly Production Recording';

//     fields
//     {
//         field(1; "AslyProdTran No."; Code[20])
//         {
//             Caption = 'Production Transaction No.';
//         }
//         field(2; "Assembly Order No."; Code[20])
//         {
//             Caption = 'Assembly Order No.';
//             TableRelation = "Assembly Header"."No.";
//         }
//         field(3; "Item Code"; Code[20])
//         {
//             Caption = 'Item Code';
//             TableRelation = Item."No.";
//         }
//         field(4; "Line No."; Integer)
//         {
//             Caption = 'Assembly Order Line No.';
//         }
//         field(5; "Produced Qty."; Decimal)
//         {
//             Caption = 'Produced Quantity';
//         }
//         field(6; "Warehouse Code"; Code[10])
//         {
//             Caption = 'From Warehouse';
//             TableRelation = Location.Code;
//             InitValue = 'PROD-WIP';
//         }
//         field(8; "Next Warehouse Code"; Code[10])
//         {
//             Caption = 'To Warehouse';
//             TableRelation = Location.Code;
//         }
//         field(9; "Next Resp. Center"; Text[50])
//         {
//             Caption = 'Next Responsibility Center';
//             TableRelation = "MoB App User";
//         }
//         field(10; "BPF Stage"; Code[20])
//         {
//             Caption = 'BPF Stage';
//         }
//         field(11; "Action Note 1"; Text[50])
//         {
//             Caption = 'Action Note 1';
//         }
//         field(12; "Action Note 2"; Text[50])
//         {
//             Caption = 'Action Note 2';
//         }
//         field(13; "Action Note 3"; Text[50])
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
//         field(20; "BPF Stage Status"; Option)
//         {
//             Caption = 'Status';
//             OptionMembers = Open,Released;
//             OptionCaption = 'Open,Released';
//         }
//         field(21; "Next BPF Stage"; Code[20])
//         {
//             Caption = 'Next BPF Stage';
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
//         key(PK; "AslyProdTran No.")
//         {
//             Clustered = true;
//         }
//         key(AssemblyLine; "Assembly Order No.", "Line No.")
//         {
//         }
//     }

//     trigger OnInsert()
//     begin
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
//         AssemblyOrder: Record "AssemblyProductionOrder";
//     begin
//         if AssemblyOrder.Get(Rec."Assembly Order No.") then begin
//             AssemblyOrder.CalcFields("Total Produced Qty.");
//             AssemblyOrder.Modify(true);
//         end;
//     end;
// }

