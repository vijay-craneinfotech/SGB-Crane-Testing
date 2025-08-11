// // File: src/BakeryOrderCard.Page.al
// page 50121 BakeryOrderCard
// {
//     PageType = Card;
//     ApplicationArea = All;
//     UsageCategory = None;
//     SourceTable = BakeryOrder;
//     Caption = 'Bakery Order Card';

//     layout
//     {
//         area(Content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
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
//                 field(Image; Rec.Image)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Image';
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
//             part(BakeryBatches; BakeryBatchesListPart)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Batches';
//                 SubPageLink = OrderID = field(ID);
//             }
//             part(BakeryUpdateHistories; BakeryUpdateHistoriesListPart)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Update History';
//                 SubPageLink = OrderID = field(ID);
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
//         area(Processing)
//         {
//             action(InsertBatch)
//             {
//                 Caption = 'Insert Batch';
//                 ApplicationArea = All;
//                 Image = Insert;
//                 RunObject = page BakeryBatchCard;
//                 RunPageLink = OrderID = field(ID);
//                 RunPageMode = Create;
//             }
//             action(InsertUpdateHistory)
//             {
//                 Caption = 'Insert Update History';
//                 ApplicationArea = All;
//                 Image = Insert;
//                 RunObject = page BakeryUpdateHistoryCard;
//                 RunPageLink = OrderID = field(ID);
//                 RunPageMode = Create;
//             }
//         }
//     }
// }

