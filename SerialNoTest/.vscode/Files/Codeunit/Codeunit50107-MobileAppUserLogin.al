codeunit 50107 "Mob App User Management"
{
    procedure ValidateMobAppUser(inputJson: Text[2024]) Response: Text[1024]
    var
        MobAppUser: Record "Mob App User";
        input: JsonObject;
        c: JsonToken;
        UserID: Code[20];
        PWS: Text[128];
        UserType: Text;
        UserName: Text[100];
        EmailID: Text[80];
        Myresult: Text[1024];
        Orderjson: JsonObject;
    begin
        if not input.ReadFrom(inputJson) then
            exit(CreateJsonPayload('0', 'False', 'Invalid JSON format', '', '', ''));

        // Get UserID
        if not input.Get('UserID', c) then
            exit(CreateJsonPayload('0', 'False', 'UserID is required', '', '', ''));
        UserID := CopyStr(c.AsValue().AsText(), 1, MaxStrLen(UserID));

        // Get Password
        if not input.Get('PWS', c) then
            exit(CreateJsonPayload('0', 'False', 'Password is required', '', '', ''));
        PWS := CopyStr(c.AsValue().AsText(), 1, MaxStrLen(PWS));

        MobAppUser.Reset();
        MobAppUser.SetRange("User ID", UserID);
        MobAppUser.SetRange(Pwd, PWS);

        if MobAppUser.FindFirst() then begin
            // Get user details
            UserType := Format(MobAppUser."Type of User");
            UserName := MobAppUser."User Name";
            EmailID := MobAppUser."Email ID";

            case MobAppUser.Status of
                MobAppUser.Status::Active:
                    begin
                        Orderjson.Add('id', '1');
                        Orderjson.Add('Success', 'True');
                        Orderjson.Add('Message', 'Login successful');
                        Orderjson.Add('UserID', UserID);
                        Orderjson.Add('UserName', UserName);
                        Orderjson.Add('EmailID', EmailID);
                        Orderjson.Add('UserType', UserType);
                        Orderjson.WriteTo(Myresult);
                        Myresult := Myresult.Replace('\', '');
                        exit(CopyStr(Myresult, 1, MaxStrLen(Response)));
                    end;
                else begin
                    Orderjson.Add('id', '0');
                    Orderjson.Add('Success', 'False');
                    Orderjson.Add('Message', 'Account is inactive. Contact administrator');
                    Orderjson.Add('UserID', UserID);
                    Orderjson.Add('UserName', UserName);
                    Orderjson.Add('EmailID', EmailID);
                    Orderjson.Add('UserType', UserType);
                    Orderjson.WriteTo(Myresult);
                    Myresult := Myresult.Replace('\', '');
                    exit(CopyStr(Myresult, 1, MaxStrLen(Response)));
                end;
            end;
        end else begin
            exit(CreateJsonPayload('0', 'False', 'Invalid user ID or password', UserID, '', ''));
        end;
    end;

    procedure ResetPassword(inputJson: Text[2024]) Response: Text[1024]
    var
        MobAppUser: Record "Mob App User";
        input: JsonObject;
        c: JsonToken;
        UserID: Code[20];
        CurrentPWS: Text[128];
        NewPWS: Text[128];
    begin
        if not input.ReadFrom(inputJson) then
            exit(CreateJsonPayload('0', 'False', 'Invalid JSON format', '', '', ''));

        // Get UserID
        if not input.Get('UserID', c) then
            exit(CreateJsonPayload('0', 'False', 'UserID is required', '', '', ''));
        UserID := CopyStr(c.AsValue().AsText(), 1, MaxStrLen(UserID));

        // Get Current Password
        if not input.Get('CurrentPWS', c) then
            exit(CreateJsonPayload('0', 'False', 'Current password is required', UserID, '', ''));
        CurrentPWS := CopyStr(c.AsValue().AsText(), 1, MaxStrLen(CurrentPWS));

        // Get New Password
        if not input.Get('NewPWS', c) then
            exit(CreateJsonPayload('0', 'False', 'New password is required', UserID, '', ''));
        NewPWS := CopyStr(c.AsValue().AsText(), 1, MaxStrLen(NewPWS));

        // Validate password requirements
        if not IsPasswordValid(NewPWS) then
            exit(CreateJsonPayload('0', 'False', 'Password must be at least 8 characters with letters and numbers', UserID, '', ''));

        // Find and authenticate user
        MobAppUser.Reset();
        MobAppUser.SetRange("User ID", UserID);
        MobAppUser.SetRange(Pwd, CurrentPWS);

        if not MobAppUser.FindFirst() then
            exit(CreateJsonPayload('0', 'False', 'Invalid current password', UserID, '', ''));

        // Check user status
        if MobAppUser.Status <> MobAppUser.Status::Active then
            exit(CreateJsonPayload('0', 'False', 'Account is inactive. Cannot reset password', UserID, MobAppUser."Email ID", ''));

        // Update password
        MobAppUser.Pwd := NewPWS;
        MobAppUser."Reset Pwd Token" := '';
        if not MobAppUser.Modify(true) then
            exit(CreateJsonPayload('0', 'False', 'Password update failed. Please try again', UserID, MobAppUser."Email ID", Format(MobAppUser."Type of User")));

        // Return success response
        exit(CreateJsonPayload('1', 'True', 'Password updated successfully', UserID, MobAppUser."Email ID", Format(MobAppUser."Type of User")));
    end;

    local procedure IsPasswordValid(Password: Text): Boolean
    var
        i: Integer;
        Char: Char;
        HasLetter: Boolean;
        HasDigit: Boolean;
    begin
        // Minimum 8 characters
        if StrLen(Password) < 8 then
            exit(false);

        // Check for at least one letter and one digit
        HasLetter := false;
        HasDigit := false;

        for i := 1 to StrLen(Password) do begin
            Char := Password[i];
            case true of
                (Char >= 'A') and (Char <= 'Z'),
                (Char >= 'a') and (Char <= 'z'):
                    HasLetter := true;
                (Char >= '0') and (Char <= '9'):
                    HasDigit := true;
            end;
            // Exit early if both found
            if HasLetter and HasDigit then
                exit(true);
        end;

        exit(HasLetter and HasDigit);
    end;

    local procedure CreateJsonPayload(
        id: Text; 
        Success: Text; 
        Message: Text; 
        UserID: Text; 
        EmailID: Text; 
        UserType: Text
    ): Text[1024]
    var
        Orderjson: JsonObject;
        jsontext: Text;
    begin
        Orderjson.Add('id', id);
        Orderjson.Add('Success', Success);
        Orderjson.Add('Message', Message);
        Orderjson.Add('UserID', UserID);
        Orderjson.Add('UserName', '');
        Orderjson.Add('EmailID', EmailID);
        Orderjson.Add('UserType', UserType);
        Orderjson.WriteTo(jsontext);
        exit(CopyStr(jsontext.Replace('\', ''), 1, 1024));
    end;

    [ServiceEnabled]
    procedure ValidateUser(var Request: Text[2024]; var Response: Text[1024])
    begin
        Response := ValidateMobAppUser(Request);
    end;

    [ServiceEnabled]
    procedure ResetUserPassword(var Request: Text[2024]; var Response: Text[1024])
    begin
        Response := ResetPassword(Request);
    end;
}

// codeunit 50107 "Mob App User Management"
// {
//     procedure ValidateMobAppUser(inputJson: Text[2024]) Response: Text[1024]
//     var
//         MobAppUser: Record "Mob App User";
//         input: JsonObject;
//         c: JsonToken;
//         UserID: Code[20];
//         PWS: Text[128];
//         UserType: Text;
//         UserName: Text[100];
//         ErrText: Text[250];
//         Myresult: Text[1024];
//         Orderjson: JsonObject;
//     begin
//         if not input.ReadFrom(inputJson) then
//             exit(CreateJsonPayload('0', 'False', 'Invalid JSON format'));

//         // Get UserID
//         if not input.Get('UserID', c) then
//             exit(CreateJsonPayload('0', 'False', 'UserID Node not found in Payload'));
//         UserID := CopyStr(c.AsValue().AsText(), 1, MaxStrLen(UserID));

//         // Get PWS
//         if not input.Get('PWS', c) then
//             exit(CreateJsonPayload('0', 'False', 'PWS Node not found in Payload'));
//         PWS := CopyStr(c.AsValue().AsText(), 1, MaxStrLen(PWS));

//         MobAppUser.Reset();
//         MobAppUser.SetRange("User ID", UserID);
//         MobAppUser.SetRange(Pwd, PWS);

//         if MobAppUser.FindFirst() then begin
//             // Get user type text representation
//             UserType := Format(MobAppUser."Type of User");

//             case MobAppUser.Status of
//                 MobAppUser.Status::Active:
//                     begin
//                         UserName := MobAppUser."User Name";
//                         Orderjson.Add('id', '1');
//                         Orderjson.Add('Success', 'True');
//                         Orderjson.Add('Message', '');
//                         Orderjson.Add('UserName', UserName);
//                         Orderjson.Add('CustomerCode', '');
//                         Orderjson.Add('UserType', UserType); // Add user type to response
//                         Orderjson.WriteTo(Myresult);
//                         Myresult := Myresult.Replace('\', '');
//                         exit(CopyStr(Myresult, 1, MaxStrLen(Response)));
//                     end;
//                 else begin
//                     UserName := MobAppUser."User Name";
//                     ErrText := 'User Not Active';
//                     // Build JSON with all fields including UserType
//                     Orderjson.Add('id', '0');
//                     Orderjson.Add('Success', 'False');
//                     Orderjson.Add('Message', ErrText);
//                     Orderjson.Add('UserName', UserName);
//                     Orderjson.Add('CustomerCode', '');
//                     Orderjson.Add('UserType', UserType);
//                     Orderjson.WriteTo(Myresult);
//                     Myresult := Myresult.Replace('\', '');
//                     exit(CopyStr(Myresult, 1, MaxStrLen(Response)));
//                 end;
//             end;
//         end else begin
//             // Build consistent JSON structure for invalid credentials
//             Orderjson.Add('id', '0');
//             Orderjson.Add('Success', 'False');
//             Orderjson.Add('Message', 'Invalid User ID or Password');
//             Orderjson.Add('UserName', '');
//             Orderjson.Add('CustomerCode', '');
//             Orderjson.Add('UserType', '');
//             Orderjson.WriteTo(Myresult);
//             Myresult := Myresult.Replace('\', '');
//             exit(CopyStr(Myresult, 1, MaxStrLen(Response)));
//         end;
//     end;

//     // New password reset procedure
//     procedure ResetPassword(inputJson: Text[2024]) Response: Text[1024]
//     var
//         MobAppUser: Record "Mob App User";
//         input: JsonObject;
//         c: JsonToken;
//         UserID: Code[20];
//         CurrentPWS: Text[128];
//         NewPWS: Text[128];
//         Orderjson: JsonObject;
//         jsontext: Text;
//     begin
//         if not input.ReadFrom(inputJson) then
//             exit(CreateJsonPayload('0', 'False', 'Invalid JSON format'));

//         // Get UserID
//         if not input.Get('UserID', c) then
//             exit(CreateJsonPayload('0', 'False', 'UserID Node not found in Payload'));
//         UserID := CopyStr(c.AsValue().AsText(), 1, MaxStrLen(UserID));

//         // Get Current Password
//         if not input.Get('CurrentPWS', c) then
//             exit(CreateJsonPayload('0', 'False', 'CurrentPWS Node not found in Payload'));
//         CurrentPWS := CopyStr(c.AsValue().AsText(), 1, MaxStrLen(CurrentPWS));

//         // Get New Password
//         if not input.Get('NewPWS', c) then
//             exit(CreateJsonPayload('0', 'False', 'NewPWS Node not found in Payload'));
//         NewPWS := CopyStr(c.AsValue().AsText(), 1, MaxStrLen(NewPWS));

//         // Validate password requirements
//         if not IsPasswordValid(NewPWS) then
//             exit(CreateJsonPayload('0', 'False', 'Password must be 8+ characters with letters and numbers'));

//         // Find and authenticate user
//         MobAppUser.Reset();
//         MobAppUser.SetRange("User ID", UserID);
//         MobAppUser.SetRange(Pwd, CurrentPWS);

//         if not MobAppUser.FindFirst() then
//             exit(CreateJsonPayload('0', 'False', 'Invalid credentials'));

//         // Check user status
//         if MobAppUser.Status <> MobAppUser.Status::Active then
//             exit(CreateJsonPayload('0', 'False', 'User account is not active'));

//         // Update password
//         MobAppUser.Pwd := NewPWS;
//         MobAppUser."Reset Pwd Token" := ''; // Clear any reset tokens
//         if not MobAppUser.Modify(true) then
//             exit(CreateJsonPayload('0', 'False', 'Password update failed'));

//         // Return success response
//         Orderjson.Add('id', '1');
//         Orderjson.Add('Success', 'True');
//         Orderjson.Add('Message', 'Password updated successfully');
//         Orderjson.WriteTo(jsontext);
//         exit(CopyStr(jsontext.Replace('\', ''), 1, 1024));
//     end;

//     local procedure IsPasswordValid(Password: Text): Boolean
//     var
//         i: Integer;
//         Char: Char;
//         HasLetter: Boolean;
//         HasDigit: Boolean;
//     begin
//         // Minimum 8 characters
//         if StrLen(Password) < 8 then
//             exit(false);

//         // Check for at least one letter and one digit
//         HasLetter := false;
//         HasDigit := false;

//         for i := 1 to StrLen(Password) do begin
//             Char := Password[i];
//             case true of
//                 (Char >= 'A') and (Char <= 'Z'),
//                 (Char >= 'a') and (Char <= 'z'):
//                     HasLetter := true;
//                 (Char >= '0') and (Char <= '9'):
//                     HasDigit := true;
//             end;
//         end;

//         exit(HasLetter and HasDigit);
//     end;


//     local procedure CreateJsonPayload(id: Text; Success: Text; Message: Text): Text[1024]
//     var
//         Orderjson: JsonObject;
//         jsontext: Text;
//     begin
//         // This function is only used for initial errors
//         Orderjson.Add('id', id);
//         Orderjson.Add('Success', Success);
//         Orderjson.Add('Message', Message);
//         Orderjson.Add('UserName', '');
//         Orderjson.Add('CustomerCode', '');
//         Orderjson.Add('UserType', '');
//         Orderjson.WriteTo(jsontext);
//         exit(CopyStr(jsontext.Replace('\', ''), 1, 1024));
//     end;

//     [ServiceEnabled]
//     procedure ValidateUser(var Request: Text[2024]; var Response: Text[1024])
//     begin
//         Response := ValidateMobAppUser(Request);
//     end;

//     // New password reset API
//     [ServiceEnabled]
//     procedure ResetUserPassword(var Request: Text[2024]; var Response: Text[1024])
//     begin
//         Response := ResetPassword(Request);
//     end;
// }
