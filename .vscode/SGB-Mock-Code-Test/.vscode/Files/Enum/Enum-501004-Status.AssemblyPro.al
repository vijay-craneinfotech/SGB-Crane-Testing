enum 50104 "Prod Status"
{
    Extensible = true;
    Caption = 'Assembly Pro Status';

    value(0; Pending)
    {
        Caption = 'Pending';
    }
    value(1; WIP)
    {
        Caption = 'WIP';
    }
    value(2; Hold)
    {
        Caption = 'Hold';
    }
    value(4; "Complete")
    {
        Caption = 'Complete';
    }
}