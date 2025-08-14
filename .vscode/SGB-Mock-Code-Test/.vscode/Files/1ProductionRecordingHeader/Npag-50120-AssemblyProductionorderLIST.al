// // File: src/AssemblyProductionList.Page.al
// page 50120 AssemblyProductionList
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Lists;
//     SourceTable = AssemblyProductionOrderHeader;
//     Caption = 'Assembly Production Orders';
//     CardPageId = "Assembly Production Order Doc";
//     Editable = false;

//     layout
//     {
//         area(Content)
//         {
//             repeater(Group)
//             {
//                 field("Assembly Order"; Rec."Assembly Order")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Assembly Order';
//                 }
//                 field("Product"; Rec."Product")
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
//                 // field(QuantityProduced; Rec.QuantityProduced)
//                 // {
//                 //     ApplicationArea = All;
//                 //     Caption = 'Quantity Produced';
//                 // }
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
        
//     }

//     actions
//     {

//         area(Processing)
//         {
//             action(NewOrder)
//             {
//                 Caption = 'New Order';
//                 ApplicationArea = All;
//                 Image = New;
//                 RunObject = page "Assembly Production Order Doc";
//                 RunPageMode = Create;
//             }
//         }
//     }
// }


