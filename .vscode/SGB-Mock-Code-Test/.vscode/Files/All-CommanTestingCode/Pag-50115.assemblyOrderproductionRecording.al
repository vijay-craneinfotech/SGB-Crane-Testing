//     page 50115 "Assembly Production Recordings"
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Lists;
//     SourceTable = "Assembly Production Recording";
//     Caption = 'Assembly Production Recordings';

//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field("AslyProdTran No."; Rec."AslyProdTran No.")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProdTran No';
//                 }
//                 field("Assembly Order No."; Rec."Assembly Order No.")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProd Assembly Order Number';
//                 }
//                 field("Item Code"; Rec."Item Code")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProd Item Code';
//                 }
//                 field("Line No."; Rec."Line No.")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProd Line NO';
//                 }
//                 field("BPF Stage Status"; Rec."BPF Stage Status")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'BPF Stage Status';
//                 }
//                 field("Produced Qty."; Rec."Produced Qty.")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProd ProducedQty';
//                 }
//                 field("Warehouse Code"; Rec."Warehouse Code")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProd Warehouse Code';
//                 }
//                 field("BPF Stage"; Rec."BPF Stage")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProdBPFStage';
//                 }
//                 field("Next Resp. Center"; Rec."Next Resp. Center")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProdNext Responsibility Center for Action';
//                 }
//                 field("Next BPF Stage"; Rec."Next BPF Stage")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'AslyProdNextBPFStage';
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
//         ManufacturingSetup: Record "Manufacturing Setup";
//         NoSeriesMgt: Codeunit "No. Series";
//     begin
//         if Rec."AslyProdTran No." = '' then begin
//             ManufacturingSetup.Get();
//             if ManufacturingSetup."AslyProdTran No. Series" = '' then
//                 Error('Number series for Assembly Production Transaction is not set in Manufacturing Setup.');
//             Rec."AslyProdTran No." := NoSeriesMgt.GetNextNo(ManufacturingSetup."AslyProdTran No. Series", WorkDate(), true);
//         end;
//     end;
// }
