// page 50153 "API Assembly BM Orders"
// {
//     PageType = API;
//     APIPublisher = 'xai';
//     APIGroup = 'assembly';
//     APIVersion = 'v1.0';
//     EntityName = 'assemblyProductionBMOrder';
//     EntitySetName = 'assemblyProductionBMOrders';
//     SourceTable = "AssemblyProductionOrderHeader";
//     ODataKeyFields = SystemId;
//     DelayedInsert = true;
//     InsertAllowed = true;
//     ModifyAllowed = true;
//     DeleteAllowed = true;

//     layout
//     {
//         area(Content)
//         {
//             repeater(Records)
//             {
//                 field(id; Rec.SystemId)
//                 {
//                     Caption = 'Id';
//                     Editable = false;
//                 }
//                 field(assemblyOrder; Rec."Assembly Order")
//                 {
//                     Caption = 'Assembly Order';
//                 }
//                 field(product; Rec.Product)
//                 {
//                     Caption = 'Product';
//                 }
//                 field(itemNo; Rec."Item No.")
//                 {
//                     Caption = 'Item No.';
//                 }
//                 field(orderQuantity; Rec.OrderQuantity)
//                 {
//                     Caption = 'Order Quantity';
//                 }
//                 field(assemblyQuantity; Rec.AssemblyQuantity)
//                 {
//                     Caption = 'Assembly Quantity';
//                 }
//                 // field(quantityProduced; Rec.QuantityProduced)
//                 // {
//                 //     Caption = 'Quantity Produced';
//                 // }
//                 field(status; Rec.Status)
//                 {
//                     Caption = 'Status';
//                 }
//                 field(dueDate; Rec.DueDate)
//                 {
//                     Caption = 'Due Date';
//                 }
//                 field(actionType; Rec.ActionType)
//                 {
//                     Caption = 'Action Type';
//                 }
//                 field(userType; Rec.UserType)
//                 {
//                     Caption = 'User Type';
//                 }
//                 field(totalProducedQty; Rec."Total Produced Qty.")
//                 {
//                     Caption = 'Total Produced Quantity';
//                 }
//                 field(balanceQuantity; Rec."Balance Quantity")
//                 {
//                     Caption = 'Balance Quantity';
//                 }
//                 field(offeredToBakerQty; Rec."Offered to Baker Qty.")
//                 {
//                     Caption = 'Offered to Baker Quantity';
//                 }
//                 field(systemCreatedAt; Rec.SystemCreatedAt)
//                 {
//                     Caption = 'Created At';
//                     Editable = false;
//                 }
//                 field(systemCreatedBy; Rec.SystemCreatedBy)
//                 {
//                     Caption = 'Created By';
//                     Editable = false;
//                 }
//                 field(systemModifiedAt; Rec.SystemModifiedAt)
//                 {
//                     Caption = 'Modified At';
//                     Editable = false;
//                 }
//                 field(systemModifiedBy; Rec.SystemModifiedBy)
//                 {
//                     Caption = 'Modified By';
//                     Editable = false;
//                 }
//             }
//             part(assemblyProductionRecordings;  "API Assembly Prod BM Line")
//             {
//                 EntityName = 'assemblyProductionBM';
//                 EntitySetName = 'assemblyProductionBM';
//                 SubPageLink = "Assembly Order No." = field("Assembly Order");
//             }
//         }
//     }
// }

