page 50130 "Assembly Prod Recordings Part"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Assembly Production Recording";
    Caption = 'Production Recordings';
    InsertAllowed = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Assembly Order No."; Rec."Assembly Order No.")
                {
                    ApplicationArea = All;
                    Caption = 'Assembly Order';
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Caption = 'Line No.';
                    Editable = false;
                }
                field("Produced Qty."; Rec."Produced Qty.")
                {
                    ApplicationArea = All;
                    Caption = 'Produced Quantity';
                    
                    trigger OnValidate()
                    var
                        Header: Record "AssemblyProductionOrder";
                    begin
                        // Live update header calculations
                        if Header.Get(Rec."Assembly Order No.") then begin
                            Header.CalcFields("Total Produced Qty.", "Offered to Baker Qty.");
                            Header."Balance Quantity" := Header.OrderQuantity - Header."Total Produced Qty.";
                            Header.Modify(true);
                        end;
                    end;
                }
                field("BPF Stage Status"; Rec."BPF Stage Status")
                {
                    ApplicationArea = All;
                    Caption = 'BPF Stage Status';
                }
                field("Warehouse Code"; Rec."Warehouse Code")
                {
                    ApplicationArea = All;
                    Caption = 'AslyProd Warehouse Code';
                }
                field("BPF Stage"; Rec."BPF Stage")
                {
                    ApplicationArea = All;
                    Caption = 'AslyProdBPFStage';
                }
                field("Next Resp. Center"; Rec."Next Resp. Center")
                {
                    ApplicationArea = All;
                    Caption = 'AslyProdNext Responsibility Center for Action';
                }
                // field("User Name"; GetUserName(Rec."Next Resp. Center"))
                // {
                //     Caption = 'User Name';
                //     Editable = false;
                //     ApplicationArea = All;
                // }
                field("Next BPF Stage"; Rec."Next BPF Stage")
                {
                    ApplicationArea = All;
                    Caption = 'AslyProdNextBPFStage';
                }
                field("Next Warehouse Code"; Rec."Next Warehouse Code")
                {
                    ApplicationArea = All;
                    Caption = 'AslyProd Next Warehosue Code';
                }
                field("Production DateTime"; Rec."Production DateTime")
                {
                    ApplicationArea = All;
                    Caption = 'Asly Prod Date';
                }
                field("Prod Record User"; Rec."Prod Record User")
                {
                    ApplicationArea = All;
                    Caption = 'Asly Prod User';
                }
                field("Transfer Required"; Rec."Transfer Required")
                {
                    ApplicationArea = All;
                    Caption = 'Transfer Required';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        ProdRecording: Record "Assembly Production Recording";
    begin
        // Auto-increment Line No. (10000, 20000, 30000...)
        ProdRecording.SetRange("Assembly Order No.", Rec."Assembly Order No.");
        if ProdRecording.FindLast() then
            Rec."Line No." := ProdRecording."Line No." + 10000
        else
            Rec."Line No." := 10000;
    end;

    // local procedure GetUserName(UserID: Code[20]): Text[100]
    // var
    //     MobUser: Record "MoB App User";
    // begin
    //     if MobUser.Get(UserID) then
    //         exit(MobUser."User Name");
    //     exit('');
    // end;
}