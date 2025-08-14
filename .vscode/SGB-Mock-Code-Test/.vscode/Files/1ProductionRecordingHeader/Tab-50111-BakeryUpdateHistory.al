// table 50102 AssemblyProductionHistory
// {
//     Caption = 'Assembly Production Update History';
//     DataClassification = CustomerContent;

//     fields
//     {
//         field(1; OrderID; Code[20])
//         {
//             Caption = 'Order ID';
//             DataClassification = CustomerContent;
//             TableRelation = AssemblyProductionOrderHeader."Assembly Order";
//         }
//         field(2; EntryNo; Integer)
//         {
//             Caption = 'Entry No.';
//             DataClassification = CustomerContent;
//             AutoIncrement = true;
//         }
//         field(3; "Date"; DateTime)
//         {
//             Caption = 'Date';
//             DataClassification = CustomerContent;
//         }
//         field(4; PreviousQty; Integer)
//         {
//             Caption = 'Previous Qty';
//             DataClassification = CustomerContent;
//         }
//         field(5; NewQty; Integer)
//         {
//             Caption = 'New Qty';
//             DataClassification = CustomerContent;
//         }
//         field(6; Notes; Text[250])
//         {
//             Caption = 'Notes';
//             DataClassification = CustomerContent;
//         }
//     }

//     keys
//     {
//         key(PK; OrderID, EntryNo)
//         {
//             Clustered = true;
//         }
//     }
// }