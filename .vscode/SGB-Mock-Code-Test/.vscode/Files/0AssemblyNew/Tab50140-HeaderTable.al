table 50140 "Production Recording Header"
{
    Caption = 'Assembly Production Order';
    DataClassification = CustomerContent;

    fields
    {
        field(5001; "Assembly Order No"; Code[20])
        {
            Caption = 'Assembly Order No';
            TableRelation = "Assembly Header"."No.";
        }
        field(5002; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            // Editable = false;
        }
        field(5003; Product; Text[100])
        {
            Caption = 'Product';
            Editable = false;
        }
        field(5004; AssemblyQuantity; Integer)
        {
            Caption = 'Assembly Quantity';
            DataClassification = CustomerContent;
        }
        field(5005; OrderQuantity; Integer)
        {
            Caption = 'Order Quantity';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec."Prod Offred Balance" := Rec.OrderQuantity;
                Modify(true)
            end;
        }
        field(5006; "Prod Offred Total"; Decimal)
        {
            Caption = 'Prod Offred Total';
        }
        field(5007; "Prod Offred Balance"; Decimal)  //balance = order qty. - Production total
        {
            Caption = 'Prod Offred Balance';
            Editable = false;
        }
        field(5008; "baker Offred Total"; Decimal)
        {
            Caption = 'baker Offred Total';
            Editable = false;
        }
        field(5009; "Baker Offred Balance"; Decimal)
        {
            Caption = 'BBaker Offred Balance';
            Editable = false;
        }
        field(5010; "BM Offred Total"; Decimal)
        {
            Caption = 'BM Offred Total';
            Editable = false;
        }
        field(5011; "BM Offred Balance"; Decimal)
        {
            Caption = 'BM Offred Balance';
            Editable = false;
        }
        field(5012; "QC Offred Total"; Decimal)
        {
            Caption = 'QC Offred Total';
            Editable = false;
        }
        field(5013; "QC Offred Balance"; Decimal)
        {
            Caption = 'QC Offred Balance';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Assembly Order No")
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