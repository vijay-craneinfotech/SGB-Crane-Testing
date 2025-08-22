table 70121 "KichProdOrderHeader"
{
    Caption = 'KichProdOrderHeader';
    DataClassification = CustomerContent;

    //KichOrderNumber  ..
    //KichSection ..
    //kichSectionName ..
    //ItemCode   ..
    //ItemDescription  ..
    //ItemImage            direct in Payload
    //KichOrdDueDate  ..
    //KichOrderQuantity  ..
    //KichProducedQuantityTotal ..
    //KichOrdBalanceQuantity ..
    //KichOrdStatus -- Hold, Pending, WIP

    //BakOrdBalanceQuantity    ..
    //BakProducedQuantityTotal ..

    //BMOrdBalanceQuantity  ..
    //BMProducedQuantityTotal  ..

    //QCOrdBalanceQuantity  ..
    //QCProducedQuantityTotal  ..

    fields
    {
        field(5001; "KichOrderNumber"; Code[20])
        {
            Caption = 'AKichOrderNumber';
            TableRelation = "Assembly Header"."No.";
        }
        field(5002; "ItemCode"; Code[20])
        {
            Caption = 'ItemCode';
            // Editable = false;
        }
        field(5003; ItemDescription; Text[100])
        {
            Caption = 'ItemDescription';
            // Editable = false;
        }
        field(5004; KichSection; Code[20])
        {
            Caption = 'KichSection';
            // Editable = false;
        }
        field(5005; kichSectionName; Text[100])
        {
            Caption = 'KichSectionName';
            // Editable = false;
        }
        field(5006; KichOrdDueDate; Date)
        {
            Caption = 'KichOrdDueDate';
            // Editable = false;
        }
        field(5007; AssemblyQuantity; Integer)
        {
            Caption = 'AssemblyQuantity';
            DataClassification = CustomerContent;
        }
        field(5008; KichOrderQuantity; Integer)
        {
            Caption = 'KichOrderQuantity';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec."KichOrdBalanceQuantity" := Rec.KichOrderQuantity;
                Modify(true)
            end;
        }
        field(5009; "KichProducedQuantityTotal"; Decimal)
        {
            Caption = 'KichProducedQuantityTotal';
        }
        field(5010; "KichOrdBalanceQuantity"; Decimal)  //balance = order qty. - Production total
        {
            Caption = 'KichOrdBalanceQuantity';
            Editable = false;
        }
        field(5011; "BakProducedQuantityTotal"; Decimal)
        {
            Caption = 'BakProducedQuantityTotal';
            Editable = false;
        }
        field(5012; "BakOrdBalanceQuantity"; Decimal)
        {
            Caption = 'BakOrdBalanceQuantity';
            Editable = false;
        }
        field(5013; "BMProducedQuantityTotal"; Decimal)
        {
            Caption = 'BM Offred Total';
            Editable = false;
        }
        field(5014; "BMOrdBalanceQuantity"; Decimal)
        {
            Caption = 'BMOrdBalanceQuantity';
            Editable = false;
        }
        field(5015; "QCProducedQuantityTotal"; Decimal)
        {
            Caption = 'QCProducedQuantityTotal';
            Editable = false;
        }
        field(5016; "QCOrdBalanceQuantity"; Decimal)
        {
            Caption = 'QCOrdBalanceQuantity';
            Editable = false;
        }
        field(5017; "KichOrdStatus"; Enum "Prod Status")
        {
            Caption = 'KichOrdStatus';
            DataClassification = CustomerContent;
            InitValue = Pending;
        }
        field(5018; "BakOrdStatus"; Enum "Prod Status")
        {
            Caption = 'BakOrdStatus';
            DataClassification = CustomerContent;
            InitValue = Pending;
        }
        field(5019; "BMOrdStatus"; Enum "Prod Status")
        {
            Caption = 'BMOrdStatus';
            DataClassification = CustomerContent;
            InitValue = Pending;
        }
        field(5020; "QCOrdStatus"; Enum "Prod Status")
        {
            Caption = 'QCOrdStatus';
            DataClassification = CustomerContent;
            InitValue = Pending;
        }
    }

    keys
    {
        key(PK; "KichOrderNumber")
        {
            Clustered = true;
        }
    }

    // trigger OnInsert()
    // begin
    //     Rec."Prod Log Balance" := Rec.OrderQuantity;
    //     Modify(true)
    //     // Rec."Baker Log Balance" := "Prod Log Total" - Rec."baker Log Total"
    // end;
}