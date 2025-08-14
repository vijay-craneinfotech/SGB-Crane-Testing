// page 50142 "API Assembly Production Orders"
// {
//     PageType = API;
//     APIPublisher = 'xai';
//     APIGroup = 'assembly';
//     APIVersion = 'v1.0';
//     EntityName = 'assemblyProductionOrder';
//     EntitySetName = 'assemblyProductionOrders';
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
//                 field(base64Image; GetBase64Image())
//                 {
//                     Caption = 'Image Base64';
//                     Editable = false;
//                 }
//             }
//             part(assemblyProductionRecordings; "API Assembly Prod Recordings")
//             {
//                 EntityName = 'assemblyProductionRecording';
//                 EntitySetName = 'assemblyProductionRecordings';
//                 SubPageLink = "Assembly Order No." = field("Assembly Order");
//             }
//         }

//     }
//     local procedure GetBase64Image(): Text
//     var
//         Item: Record Item;
//         TenantMedia: Record "Tenant Media";
//         Base64: Codeunit "Base64 Convert";
//         InStream: InStream;
//         PictureId: Guid;
//     begin
//         if Rec."Item No." <> '' then begin
//             if Item.Get(Rec."Item No.") then begin
//                 if Item.Picture.Count > 0 then begin
//                     PictureId := Item.Picture.Item(1);
//                     if TenantMedia.Get(PictureId) then begin
//                         TenantMedia.CalcFields(Content);
//                         if TenantMedia.Content.HasValue then begin
//                             TenantMedia.Content.CreateInStream(InStream);
//                             exit(Base64.ToBase64(InStream));
//                         end;
//                     end;
//                 end;
//             end;
//         end;
//         exit('');
//     end;
//     trigger OnAfterGetRecord()
//     begin
//         Rec.CalcFields("Total Produced Qty.", "Offered to Baker Qty.");
//           Rec."Balance quantity" := Rec.OrderQuantity - Rec."Total Produced Qty.";
//     end;
// }



