pageextension 50107 SGBUserRoleCenterCombined extends "Business Manager Role Center"
{
    layout               //VJ Working
    {
        //    addafter("Job Queue Tasks Activities")
        //    {
        //        part(DealStatusCues; "DCB Deal Status Cues")
        //        {
        //            ApplicationArea = All;
        //            Caption = 'Deal Status Overview';
        //        }
        //        part(BLTrackingCues; "BL Tracking Status Cues")
        //        {
        //            ApplicationArea = All;
        //            Caption = 'BL Tracking Overview';
        //        }
        //    }
    }
    actions
    {
        // 1. Add to Creation area
        addfirst(creation)
        {
            //   action("Deal Registration")
            //   {
            //       ApplicationArea = All;
            //       Caption = 'Deal Registration';
            //       Image = NewDocument;
            //       RunObject = Page "DCB Deal Card";
            //       RunPageMode = Create;
            //       ToolTip = 'Register a new business deal';
            //   }
        }

        // 2. Add SGB Tools before Finance section
        addbefore(Action39)
        {
            group("SGB Tools")
            {
                Caption = 'SGB Tools';
                Image = Administration;

                action("SGB Mob App User List")
                {
                    Caption = 'SGB Mob App User List';
                    ApplicationArea = All;
                    Image = Document;
                    RunObject = Page "Mob App User List";
                }
                action("Kitchen Section List")
                {
                    Caption = 'Kitchen Section List';
                    ApplicationArea = All;
                    Image = Document;
                    RunObject = Page "Kitchen Section List";
                }
                action("Kit-Section Matrix List")
                {
                    Caption = 'Kit-Section Matrix List';
                    ApplicationArea = All;
                    Image = Document;
                    RunObject = Page "Kit-Section Matrix List";
                }
            }
        }
    }


}