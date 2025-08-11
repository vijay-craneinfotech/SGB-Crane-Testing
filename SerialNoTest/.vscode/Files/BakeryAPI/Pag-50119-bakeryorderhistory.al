// page 50119 BakeryUpdateHistoriesAPI
// {
//     APIVersion = 'v2.0';
//     EntityCaption = 'Bakery Update History';
//     EntitySetCaption = 'Bakery Update Histories';
//     EntityName = 'bakeryUpdateHistory';
//     EntitySetName = 'bakeryUpdateHistories';
//     ODataKeyFields = OrderID, EntryNo;
//     APIPublisher = 'custom';
//     APIGroup = 'bakery';
//     PageType = API;
//     SourceTable = BakeryUpdateHistory;
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
//                 field(entryNo; Rec.EntryNo)
//                 {
//                     Caption = 'entryNo';
//                 }
//                 field(date; Rec."Date")
//                 {
//                     Caption = 'date';
//                 }
//                 field(previousQty; Rec.PreviousQty)
//                 {
//                     Caption = 'previousQty';
//                 }
//                 field(newQty; Rec.NewQty)
//                 {
//                     Caption = 'newQty';
//                 }
//                 field(notes; Rec.Notes)
//                 {
//                     Caption = 'notes';
//                 }
//             }
//         }
//     }
// }