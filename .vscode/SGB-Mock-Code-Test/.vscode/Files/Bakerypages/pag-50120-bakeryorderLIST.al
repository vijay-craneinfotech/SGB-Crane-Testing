// // File: src/BakeryOrdersList.Page.al
// page 50120 BakeryOrdersList
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Lists;
//     SourceTable = BakeryOrder;
//     Caption = 'Bakery Orders';
//     CardPageId = BakeryOrderCard;
//     Editable = false;

//     layout
//     {
//         area(Content)
//         {
//             repeater(Group)
//             {
//                 field(ID; Rec.ID)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'ID';
//                 }
//                 field(Product; Rec.Product)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Product';
//                 }
//                 field(OrderQuantity; Rec.OrderQuantity)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Order Quantity';
//                 }
//                 field(AssemblyQuantity; Rec.AssemblyQuantity)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Assembly Quantity';
//                 }
//                 field(QuantityProduced; Rec.QuantityProduced)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Quantity Produced';
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Status';
//                 }
//                 field(DueDate; Rec.DueDate)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Due Date';
//                 }
//                 field(ActionType; Rec.ActionType)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Action Type';
//                 }
//                 field(UserType; Rec.UserType)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'User Type';
//                 }
//             }
//         }
//         area(FactBoxes)
//         {
//             systempart(Links; Links)
//             {
//                 ApplicationArea = All;
//             }
//             systempart(Notes; Notes)
//             {
//                 ApplicationArea = All;
//             }
//         }
//     }

//     actions
//     {
//         area(Navigation)
//         {
//             action(ViewBatches)
//             {
//                 Caption = 'View Batches';
//                 ApplicationArea = All;
//                 Image = View;
//                 RunObject = page BakeryBatchesList;
//                 RunPageLink = OrderID = field(ID);
//             }
//             action(ViewUpdateHistory)
//             {
//                 Caption = 'View Update History';
//                 ApplicationArea = All;
//                 Image = View;
//                 RunObject = page BakeryUpdateHistoriesList;
//                 RunPageLink = OrderID = field(ID);
//             }
//         }
//         area(Processing)
//         {
//             action(NewOrder)
//             {
//                 Caption = 'New Order';
//                 ApplicationArea = All;
//                 Image = New;
//                 RunObject = page BakeryOrderCard;
//                 RunPageMode = Create;
//             }
//         }
//     }
// }

