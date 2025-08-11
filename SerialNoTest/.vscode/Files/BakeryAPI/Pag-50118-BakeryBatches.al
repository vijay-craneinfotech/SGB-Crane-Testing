// page 50118 BakeryBatchesAPI
// {
//     APIVersion = 'v2.0';
//     EntityCaption = 'Bakery Batch';
//     EntitySetCaption = 'Bakery Batches';
//     EntityName = 'bakeryBatch';
//     EntitySetName = 'bakeryBatches';
//     ODataKeyFields = OrderID, BatchID;
//     APIPublisher = 'custom';
//     APIGroup = 'bakery';
//     PageType = API;
//     SourceTable = BakeryBatch;
//     DelayedInsert = true;

//     layout
//     {
//         area(Content)
//         {
//             repeater(Group)
//             {
//                 field(orderId; Rec.OrderID)
//                 {
//                     Caption = 'orderId';
//                 }
//                 field(batchId; Rec.BatchID)
//                 {
//                     Caption = 'batchId';
//                 }
//                 field(quantity; Rec.Quantity)
//                 {
//                     Caption = 'quantity';
//                 }
//                 field(date; Rec."Date")
//                 {
//                     Caption = 'date';
//                 }
//                 field(time; Rec."Time")
//                 {
//                     Caption = 'time';
//                 }
//                 field(shift; Rec.Shift)
//                 {
//                     Caption = 'shift';
//                 }
//                 field(staff; Rec.Staff)
//                 {
//                     Caption = 'staff';
//                 }
//                 field(kitchen; Rec.Kitchen)
//                 {
//                     Caption = 'kitchen';
//                 }
//                 field(oven; Rec.Oven)
//                 {
//                     Caption = 'oven';
//                 }
//                 field(temperature; Rec.Temperature)
//                 {
//                     Caption = 'temperature';
//                 }
//                 field(duration; Rec.Duration)
//                 {
//                     Caption = 'duration';
//                 }
//                 field(status; Rec.Status)
//                 {
//                     Caption = 'status';
//                 }
//                 field(overTemperature; Rec.OverTemperature)
//                 {
//                     Caption = 'overTemperature';
//                 }
//                 field(remarks; Rec.Remarks)
//                 {
//                     Caption = 'remarks';
//                 }
//                 field(isRemarkDone; Rec.IsRemarkDone)
//                 {
//                     Caption = 'isRemarkDone';
//                 }
//                 field(isTempUpdated; Rec.IsTempUpdated)
//                 {
//                     Caption = 'isTempUpdated';
//                 }
//             }
//         }
//     }
// }