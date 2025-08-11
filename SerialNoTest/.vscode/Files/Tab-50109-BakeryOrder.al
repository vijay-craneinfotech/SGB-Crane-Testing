// table 50109 BakeryOrder
// {
//     Caption = 'Bakery Order';
//     DataClassification = CustomerContent;

//     fields
//     {
//         field(1; ID; Code[20])
//         {
//             Caption = 'ID';
//             DataClassification = CustomerContent;
//         }
//         field(2; Product; Text[100])
//         {
//             Caption = 'Product';
//             DataClassification = CustomerContent;
//         }
//         field(3; Image; Text[2048])
//         {
//             Caption = 'Image';
//             DataClassification = CustomerContent;
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
//         field(7; Status; Text[50])
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
//         field(10; UserType; Enum BakeryUserType)
//         {
//             Caption = 'User Type';
//             DataClassification = CustomerContent;
//         }
//     }

//     keys
//     {
//         key(PK; ID)
//         {
//             Clustered = true;
//         }
//     }
// }