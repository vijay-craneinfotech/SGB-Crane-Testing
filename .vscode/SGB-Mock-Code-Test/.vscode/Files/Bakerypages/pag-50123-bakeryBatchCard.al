// // File: src/BakeryBatchesListPart.Page.al
// page 50123 BakeryBatchesListPart
// {
//     PageType = ListPart;
//     ApplicationArea = All;
//     UsageCategory = None;
//     SourceTable = BakeryBatch;
//     Caption = 'Bakery Batches';

//     layout
//     {
//         area(Content)
//         {
//             repeater(Group)
//             {
//                 field(BatchID; Rec.BatchID)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Batch ID';
//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Quantity';
//                 }
//                 field("Date"; Rec."Date")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Date';
//                 }
//                 field("Time"; Rec."Time")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Time';
//                 }
//                 field(Shift; Rec.Shift)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Shift';
//                 }
//                 field(Staff; Rec.Staff)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Staff';
//                 }
//                 field(Kitchen; Rec.Kitchen)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Kitchen';
//                 }
//                 field(Oven; Rec.Oven)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Oven';
//                 }
//                 field(Temperature; Rec.Temperature)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Temperature';
//                 }
//                 field(Duration; Rec.Duration)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Duration';
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Status';
//                 }
//                 field(OverTemperature; Rec.OverTemperature)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Over Temperature';
//                 }
//                 field(Remarks; Rec.Remarks)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Remarks';
//                 }
//                 field(IsRemarkDone; Rec.IsRemarkDone)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Is Remark Done';
//                 }
//                 field(IsTempUpdated; Rec.IsTempUpdated)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Is Temp Updated';
//                 }
//             }
//         }
//     }
// }

