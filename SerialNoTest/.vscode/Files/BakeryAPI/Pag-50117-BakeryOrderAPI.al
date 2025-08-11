// page 50117 BakeryOrdersAPI
// {
//     APIVersion = 'v2.0';
//     EntityCaption = 'Bakery Order';
//     EntitySetCaption = 'Bakery Orders';
//     EntityName = 'bakeryOrder';
//     EntitySetName = 'bakeryOrders';
//     ODataKeyFields = ID;
//     APIPublisher = 'custom';
//     APIGroup = 'bakery';
//     PageType = API;
//     SourceTable = BakeryOrder;
//     DelayedInsert = true;

//     layout
//     {
//         area(Content)
//         {
//             repeater(Group)
//             {
//                 field(id; Rec.ID)
//                 {
//                     Caption = 'id';
//                 }
//                 field(product; Rec.Product)
//                 {
//                     Caption = 'product';
//                 }
//                 field(image; Rec.Image)
//                 {
//                     Caption = 'image';
//                 }
//                 field(orderQuantity; Rec.OrderQuantity)
//                 {
//                     Caption = 'orderQuantity';
//                 }
//                 field(assemblyQuantity; Rec.AssemblyQuantity)
//                 {
//                     Caption = 'assemblyQuantity';
//                 }
//                 field(quantityProduced; Rec.QuantityProduced)
//                 {
//                     Caption = 'quantityProduced';
//                 }
//                 field(status; Rec.Status)
//                 {
//                     Caption = 'status';
//                 }
//                 field(dueDate; Rec.DueDate)
//                 {
//                     Caption = 'dueDate';
//                 }
//                 field(actionType; Rec.ActionType)
//                 {
//                     Caption = 'actionType';
//                 }
//             }
//             part(bakeryBatches; BakeryBatchesAPI)
//             {
//                 Caption = 'batches';
//                 EntityName = 'bakeryBatch';
//                 EntitySetName = 'bakeryBatches';
//                 SubPageLink = OrderID = field(ID);
//             }
//             part(bakeryUpdateHistories; BakeryUpdateHistoriesAPI)
//             {
//                 Caption = 'updateHistory';
//                 EntityName = 'bakeryUpdateHistory';
//                 EntitySetName = 'bakeryUpdateHistories';
//                 SubPageLink = OrderID = field(ID);
//             }
//         }
//     }
// }