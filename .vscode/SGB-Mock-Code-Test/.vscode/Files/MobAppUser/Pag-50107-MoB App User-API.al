page 50107 "Mob App User API"
{
    PageType = API;
    APIPublisher = 'CraneVJ';
    APIGroup = 'mobile';
    APIVersion = 'v1.0';
    EntityName = 'mobileAppUser';
    EntitySetName = 'mobileAppUsers';
    SourceTable = "Mob App User";
    DelayedInsert = true;
    ODataKeyFields = "User ID";
    Caption = 'Mob App User API';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(userID; Rec."User ID")
                {
                    Caption = 'userID';
                }
                field(userName; Rec."User Name")
                {
                    Caption = 'userName';
                }
                field(password; Rec.Pwd)
                {
                    Caption = 'password';
                }
                field(emailID; Rec."Email ID")
                {
                    Caption = 'emailID';
                }
                field(userFieldOfBC; Rec."User Field of BC")
                {
                    Caption = 'userFieldOfBC';
                }
                field(status; Rec.Status)
                {
                    Caption = 'status';
                }
                field(resetPwdToken; Rec."Reset Pwd Token")
                {
                    Caption = 'resetPwdToken';
                }
                field(typeOfUser; Rec."Type of User")
                {
                    Caption = 'typeOfUser';
                }
            }
        }
    }
}

