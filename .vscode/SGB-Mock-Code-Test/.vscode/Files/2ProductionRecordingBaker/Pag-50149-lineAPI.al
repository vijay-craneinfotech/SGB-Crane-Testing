// page 50149 "API Assembly Prod Baker"
// {
//     PageType = API;
//     APIPublisher = 'VJ';
//     APIGroup = 'assembly';
//     APIVersion = 'v1.0';
//     EntityName = 'assemblyProductionBaker';
//     EntitySetName = 'assemblyProductionBaker';
//     SourceTable = "Assembly Production Baker";
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
//                 field(assemblyOrderNo; Rec."Assembly Order No.")
//                 {
//                     Caption = 'Assembly Order No.';
//                 }
//                 field(itemCode; Rec."Item Code")
//                 {
//                     Caption = 'Item Code';
//                 }
//                 field(lineNo; Rec."Line No.")
//                 {
//                     Caption = 'Line No.';
//                 }
//                 field(producedQty; Rec."Produced Qty.")
//                 {
//                     Caption = 'Produced Quantity';
//                 }
//                 field(warehouseCode; Rec."Warehouse Code")
//                 {
//                     Caption = 'From Warehouse';
//                 }
//                 field(nextWarehouseCode; Rec."Next Warehouse Code")
//                 {
//                     Caption = 'To Warehouse';
//                 }
//                 field(bpfStage; Rec."BPF Stage")
//                 {
//                     Caption = 'BPF Stage';
//                 }
//                 field(actionNote1; Rec."Action Note 1")
//                 {
//                     Caption = 'Action Note 1';
//                 }
//                 field(actionNote2; Rec."Action Note 2")
//                 {
//                     Caption = 'Action Note 2';
//                 }
//                 field(actionNote3; Rec."Action Note 3")
//                 {
//                     Caption = 'Action Note 3';
//                 }
//                 field(productionDateTime; Rec."Production DateTime")
//                 {
//                     Caption = 'Production Date/Time';
//                 }
//                 field(prodRecordUser; Rec."Prod Record User")
//                 {
//                     Caption = 'Production Recorder';
//                 }
//                 field(bakerRecordDateTime; Rec."Baker Record DateTime")
//                 {
//                     Caption = 'Baker Record Date/Time';
//                 }
//                 field(bakerUser; Rec."Baker User")
//                 {
//                     Caption = 'Baker User';
//                 }
//                 field(transferRequired; Rec."Transfer Required")
//                 {
//                     Caption = 'Transfer Required';
//                 }
//                 field(shift; Rec."Shift")
//                 {
//                     Caption = 'Shift';
//                 }
//                 field(staff; Rec."Staff")
//                 {
//                     Caption = 'Staff';
//                 }
//                 field(kitchen; Rec."Kitchen")
//                 {
//                     Caption = 'Kitchen';
//                 }
//                 field(oven; Rec."Oven")
//                 {
//                     Caption = 'Oven';
//                 }
//                 field(temperature; Rec."Temperature")
//                 {
//                     Caption = 'Temperature';
//                 }
//                 field(duration; Rec."Duration")
//                 {
//                     Caption = 'Duration';
//                 }
//                 field(status; Rec."Status")
//                 {
//                     Caption = 'Status';
//                 }
//                 field(manufacturingDate; Rec."Manufacturing Date")
//                 {
//                     Caption = 'Manufacturing Date';
//                 }
//                 field(expiryDate; Rec."Expiry Date")
//                 {
//                     Caption = 'Expiry Date';
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
//         }
//     }
// }