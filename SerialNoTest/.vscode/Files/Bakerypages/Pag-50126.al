// // File: src/BakeryUpdateHistoriesListPart.Page.al
// page 50126 BakeryUpdateHistoriesListPart
// {
//     PageType = ListPart;
//     ApplicationArea = All;
//     UsageCategory = None;
//     SourceTable = BakeryUpdateHistory;
//     Caption = 'Bakery Update Histories';

//     layout
//     {
//         area(Content)
//         {
//             repeater(Group)
//             {
//                 field(EntryNo; Rec.EntryNo)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Entry No.';
//                 }
//                 field("Date"; Rec."Date")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Date';
//                 }
//                 field(PreviousQty; Rec.PreviousQty)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Previous Qty';
//                 }
//                 field(NewQty; Rec.NewQty)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'New Qty';
//                 }
//                 field(Notes; Rec.Notes)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Notes';
//                 }
//             }
//         }
//     }
// }


