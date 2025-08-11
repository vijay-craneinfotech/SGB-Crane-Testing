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
//            // TableRelation = "Assembly Line"."Line No." WHERE("Document No." = FIELD("Assembly Order No."));
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
//         field(9; "Next Resp. Center"; Code[20])
//         {
//             Caption = 'Next Responsibility Center';
//             TableRelation = "MoB App User"."Type of User";
//            // TableRelation = "Responsibility Center"."Code";
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
// }