// table 50110 BakeryBatch
// {
//     Caption = 'Bakery Batch';
//     DataClassification = CustomerContent;

//     fields
//     {
//         field(1; OrderID; Code[20])
//         {
//             Caption = 'Order ID';
//             DataClassification = CustomerContent;
//             TableRelation = BakeryOrder.ID;
//         }
//         field(2; BatchID; Code[20])
//         {
//             Caption = 'Batch ID';
//             DataClassification = CustomerContent;
//         }
//         field(3; Quantity; Integer)
//         {
//             Caption = 'Quantity';
//             DataClassification = CustomerContent;
//         }
//         field(4; "Date"; Date)
//         {
//             Caption = 'Date';
//             DataClassification = CustomerContent;
//         }
//         field(5; "Time"; Time)
//         {
//             Caption = 'Time';
//             DataClassification = CustomerContent;
//         }
//         field(6; Shift; Text[50])
//         {
//             Caption = 'Shift';
//             DataClassification = CustomerContent;
//         }
//         field(7; Staff; Text[50])
//         {
//             Caption = 'Staff';
//             DataClassification = CustomerContent;
//         }
//         field(8; Kitchen; Text[50])
//         {
//             Caption = 'Kitchen';
//             DataClassification = CustomerContent;
//         }
//         field(9; Oven; Text[50])
//         {
//             Caption = 'Oven';
//             DataClassification = CustomerContent;
//         }
//         field(10; Temperature; Text[20])
//         {
//             Caption = 'Temperature';
//             DataClassification = CustomerContent;
//         }
//         field(11; Duration; Text[20])
//         {
//             Caption = 'Duration';
//             DataClassification = CustomerContent;
//         }
//         field(12; Status; Text[20])
//         {
//             Caption = 'Status';
//             DataClassification = CustomerContent;
//         }
//         field(13; OverTemperature; Text[50])
//         {
//             Caption = 'Over Temperature';
//             DataClassification = CustomerContent;
//         }
//         field(14; Remarks; Text[250])
//         {
//             Caption = 'Remarks';
//             DataClassification = CustomerContent;
//         }
//         field(15; IsRemarkDone; Boolean)
//         {
//             Caption = 'Is Remark Done';
//             DataClassification = CustomerContent;
//         }
//         field(16; IsTempUpdated; Boolean)
//         {
//             Caption = 'Is Temp Updated';
//             DataClassification = CustomerContent;
//         }
//     }

//     keys
//     {
//         key(PK; OrderID, BatchID)
//         {
//             Clustered = true;
//         }
//     }
// }