// table 50121 "AssemblyProductionBakerHeader"
// {
//     Caption = 'Assembly Production Order';
//     DataClassification = CustomerContent;

//     fields
//     {
//         field(1; "Assembly Order"; Code[20])
//         {
//             Caption = 'Assembly Order';
//             TableRelation = "Assembly Header"."No.";

//         }
//         field(2; Product; Text[100])
//         {
//             Caption = 'Product';
//             FieldClass = FlowField;
//             CalcFormula = lookup(Item.Description where("No." = field("Item No.")));
//             Editable = false;
//         }
//         field(3; "Item No."; Code[20])
//         {
//             Caption = 'Item No.';
//             TableRelation = Item."No.";
//             Editable = false;
//         }
//         field(4; OrderQuantity; Integer)
//         {
//             Caption = 'Order Quantity';
//             DataClassification = CustomerContent;
//         }
//         field(5; AssemblyQuantity; Integer)
//         {
//             Caption = 'Assembly Quantity';
//             DataClassification = CustomerContent;
//         }
//         field(6; QuantityProduced; Integer)
//         {
//             Caption = 'Quantity Produced';
//             DataClassification = CustomerContent;
//         }
//         field(7; Status; Enum "Assembly Pro Status")
//         {
//             Caption = 'Status';
//             DataClassification = CustomerContent;
//         }
//         field(8; DueDate; Date)
//         {
//             Caption = 'Due Date';
//             DataClassification = CustomerContent;
//         }
//         field(9; ActionType; Text[20])
//         {
//             Caption = 'Action Type';
//             DataClassification = CustomerContent;
//         }
//         field(10; UserType; Enum "AppUserType")
//         {
//             Caption = 'User Type';
//             DataClassification = CustomerContent;
//         }
//         field(11; "Total Produced Qty."; Decimal)
//         {
//             Caption = 'Total Produced Quantity';
//             FieldClass = FlowField;
//             CalcFormula = sum("Assembly Production Baker"."Produced Qty." 
//                 where("Assembly Order No." = field("Assembly Order")));
//             Editable = false;
//         }
//         field(12; "Balance Quantity"; Decimal)
//         {
//             Caption = 'Balance Quantity';
//             //Editable = false;
//         }
//         field(13; "Offered to Baker Qty."; Decimal)
//         {
//             Caption = 'Offered to Baker Quantity';
//             FieldClass = FlowField;
//             CalcFormula = sum("Assembly Production Baker"."Produced Qty." 
//                 where("Assembly Order No." = field("Assembly Order"),
//                      Status = filter("Offered to Baker" | "Partially Offered to Baker")));
//             // Editable = false;
//         }
//     }

//     keys
//     {
//         key(PK; "Assembly Order")
//         {
//             Clustered = true;
//         }
//     }
// }