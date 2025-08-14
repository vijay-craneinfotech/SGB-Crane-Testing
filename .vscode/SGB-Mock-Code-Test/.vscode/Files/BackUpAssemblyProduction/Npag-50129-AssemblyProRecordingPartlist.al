// page 50130 "Assembly Prod Recordings Part"
// {
//     PageType = ListPart;
//     ApplicationArea = All;
//     SourceTable = "Assembly Production Recording";
//     Caption = 'Production Recordings';
//     InsertAllowed = true;
//     DelayedInsert = true;

//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field("Assembly Order No."; Rec."Assembly Order No.")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Assembly Order';
//                     Editable = false;
//                 }
//                 field("Line No."; Rec."Line No.")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Line No.';
//                     Editable = false;
//                 }
//                 field("Produced Qty."; Rec."Produced Qty.")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Produced Quantity';

//                     trigger OnValidate()
//                     var
//                         Header: Record "AssemblyProductionOrder";
//                         AssemblyOrder: Page "Assembly Production Order Doc";
//                     begin
//                         // Live update header calculations
//                         if Header.Get(Rec."Assembly Order No.") then begin
//                             Header.CalcFields("Total Produced Qty.", "Offered to Baker Qty.");
//                             // Header."Balance Quantity" := Header.OrderQuantity - Header."Total Produced Qty.";
//                              Header.Validate("Balance Quantity" ,( Header.OrderQuantity - Header."Total Produced Qty."));
//                             Header.Modify(true);
                        
//                         end;
//                         AssemblyOrder.Update(true);
//                     end;
//                 }
                
//                 field("Warehouse Code"; Rec."Warehouse Code")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProd Warehouse Code';
//                 }
                
                
//                 field("Next Warehouse Code"; Rec."Next Warehouse Code")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProd Next Warehosue Code';
//                 }
//                 field("Production DateTime"; Rec."Production DateTime")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Asly Prod Date';
//                 }
//                 field("Prod Record User"; Rec."Prod Record User")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Asly Prod User';
//                 }
//                 field("Shift"; Rec."Shift")
//                 {
//                     Caption = 'Shift';

//                 }
//                 field("Staff"; Rec."Staff")
//                 {
//                     Caption = 'Staff';

//                 }
//                 field("Kitchen"; Rec."Kitchen")
//                 {
//                     Caption = 'Kitchen';

//                 }
//                 field("Oven"; Rec."Oven")
//                 {
//                     Caption = 'Oven';

//                 }
//                 field("Temperature"; Rec."Temperature")
//                 {
//                     Caption = 'Temperature';

//                 }
//                 field("Duration"; Rec."Duration")
//                 {
//                     Caption = 'Duration';
//                 }
//                 field("Status"; Rec."Status")
//                 {
//                     Caption = 'Status';
//                 }
//                 field("Manufacturing Date"; Rec."Manufacturing Date")
//                 {
//                     Caption = 'Manufacturing Date';
//                 }
//                 field("Expiry Date"; Rec."Expiry Date")
//                 {
//                     Caption = 'Expiry Date';
//                 }
//                 field("Transfer Required"; Rec."Transfer Required")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Transfer Required';
//                 }
//             }

//         }
//     }

//     trigger OnNewRecord(BelowxRec: Boolean)
//     var
//         ProdRecording: Record "Assembly Production Recording";
//     begin
//         ProdRecording.SetRange("Assembly Order No.", Rec."Assembly Order No.");
//         if ProdRecording.FindLast() then
//             Rec."Line No." := ProdRecording."Line No." + 10000
//         else
//             Rec."Line No." := 10000;
//     end;

    
// }