page 50132 "Assembly Production Order Doc"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "AssemblyProductionOrder";
    Caption = 'Assembly Production Order';
    SourceTableView = where("Assembly Order" = filter(<> ''));

    layout
    {
        area(Content)
        {
            group(Header)
            {
                field("Assembly Order"; Rec."Assembly Order")
                {
                    ApplicationArea = All;
                    Caption = 'Assembly Order';
                }
                field(Product; Rec.Product)
                {
                    ApplicationArea = All;
                    Caption = 'Product';
                    Editable = false;
                }
                field(OrderQuantity; Rec.OrderQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'Order Quantity';
                }
                field("Total Produced Qty."; Rec."Total Produced Qty.")
                {
                    ApplicationArea = All;
                    Caption = 'Produced Quantity';
                    Editable = false;
                }
                field("Balance Quantity"; Rec."Balance Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Balance Quantity';
                    Editable = false;
                    Style = Strong;
                }
                field("Offered to Baker Qty."; Rec."Offered to Baker Qty.")
                {
                    ApplicationArea = All;
                    Caption = 'Offered to Baker Quantity';
                    Editable = false;
                }
                field(AssemblyQuantity; Rec.AssemblyQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'Assembly Quantity';
                }
                field(QuantityProduced; Rec.QuantityProduced)
                {
                    ApplicationArea = All;
                    Caption = 'Quantity Produced';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }
                field(DueDate; Rec.DueDate)
                {
                    ApplicationArea = All;
                    Caption = 'Due Date';
                }
                field(ActionType; Rec.ActionType)
                {
                    ApplicationArea = All;
                    Caption = 'Action Type';
                }
                field(UserType; Rec.UserType)
                {
                    ApplicationArea = All;
                    Caption = 'User Type';
                }
                
            }
            part(ProductionRecordings; "Assembly Prod Recordings Part")
            {
                ApplicationArea = All;
                SubPageLink = "Assembly Order No." = field("Assembly Order");
            }
            // part(AssemblyProBatches; AssemblyProBatchesListPart)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Batches';
            //     SubPageLink = OrderID = field(ID);
            // }
            part(AssemblyProUpdateHistories; AssemblyProHistoriesPartList)
            {
                ApplicationArea = All;
                Caption = 'Update History';
                SubPageLink = OrderID = field("Assembly Order");
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        // Recalculate balances on record load
        Rec.CalcFields("Total Produced Qty.", "Offered to Baker Qty.");
        Rec."Balance Quantity" := Rec.OrderQuantity - Rec."Total Produced Qty.";
    end;
}