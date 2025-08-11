enum 50104 "Assembly Pro Status"
{
    Caption = 'Assembly Pro Status';

    value(0; Pending)
    {
        Caption = 'Pending';
    }
    value(1; Accepted)
    {
        Caption = 'Accepted';
    }
    value(2; Hold)
    {
        Caption = 'Hold';
    }
    value(3; "Partially Produced")
    {
        Caption = 'Partially Produced';
    }
    value(4; "Completely Produced")
    {
        Caption = 'Completely Produced';
    }
    value(5; "Partially Offered to Baker")
    {
        Caption = 'Partially Offered to Baker';
    }
    value(6; "Offered to Baker")
    {
        Caption = 'Offered to Baker';
    }
}