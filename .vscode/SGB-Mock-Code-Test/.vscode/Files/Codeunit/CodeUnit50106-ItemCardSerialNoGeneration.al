// Serial Number Creation Codeunit
codeunit 50106 "Item Serial Number Creation"
{
    procedure CreateSerialNumbersByQuantity(ItemNo: Code[20]; VariantCode: Code[10]; Qty: Integer): Integer
    var
        Item: Record Item;
        NoSeriesManagement: Codeunit "No. Series";
        i: Integer;
        SerialNo: Code[50];
        CreatedCount: Integer;
    begin
        if Qty <= 0 then
            exit(0);

        if not Item.Get(ItemNo) then
            exit(0);

        if Item."Serial Nos." = '' then
            Error('Serial number series is not set up for item %1.', ItemNo);

        for i := 1 to Qty do begin
            SerialNo := NoSeriesManagement.GetNextNo(Item."Serial Nos.", WorkDate(), true);
            if CreateSerialNoInformation(ItemNo, VariantCode, SerialNo) then
                CreatedCount += 1;
        end;

        exit(CreatedCount);
    end;

    procedure CreateCustomSerialNumbers(ItemNo: Code[20]; VariantCode: Code[10]; CustomizedSN: Code[50]; Increment: Integer; Qty: Integer): Integer
    var
        i: Integer;
        SerialNo: Code[50];
        CurrentSerialNo: Code[50];
        CreatedCount: Integer;
    begin
        if Qty <= 0 then
            exit(0);

        // Validate custom serial number format
        if not HasNumericEnding(CustomizedSN) then
            Error('Custom serial number must end with a numeric sequence.');

        CurrentSerialNo := CustomizedSN;
        for i := 1 to Qty do begin
            SerialNo := CurrentSerialNo;
            if CreateSerialNoInformation(ItemNo, VariantCode, SerialNo) then
                CreatedCount += 1;
            CurrentSerialNo := IncrementSerialNo(CurrentSerialNo, Increment);
        end;

        exit(CreatedCount);
    end;

    local procedure CreateSerialNoInformation(ItemNo: Code[20]; VariantCode: Code[10]; SerialNo: Code[50]): Boolean
    var
        SerialNoInformation: Record "Serial No. Information";
        IsHandled: Boolean;
    begin
        if SerialNo = '' then
            exit(false);

        if SerialNoInformation.Get(ItemNo, VariantCode, SerialNo) then
            exit(false);

        OnBeforeCreateSerialNoInformation(ItemNo, VariantCode, SerialNo, IsHandled);
        if IsHandled then
            exit(false);

        SerialNoInformation.Init();
        SerialNoInformation."Item No." := ItemNo;
        SerialNoInformation."Variant Code" := VariantCode;
        SerialNoInformation."Serial No." := SerialNo;
        SerialNoInformation.Insert(true);

        OnAfterCreateSerialNoInformation(SerialNoInformation);
        exit(true);
    end;

    local procedure IncrementSerialNo(SerialNo: Code[50]; Increment: Integer): Code[50]
    var
        i: Integer;
        NumStr: Text;
        OriginalLength: Integer;
        Num: Integer;
        Prefix: Text;
        NewNumStr: Text;
    begin
        if Increment = 0 then
            exit(SerialNo);

        // Find last numeric sequence from end
        i := StrLen(SerialNo);
        while (i > 0) and (SerialNo[i] in ['0'..'9']) do
            i := i - 1;

        // If no digits at end, append increment
        if i = StrLen(SerialNo) then
            exit(SerialNo + Format(Increment));

        // Extract numeric part
        NumStr := CopyStr(SerialNo, i + 1);
        OriginalLength := StrLen(NumStr);
        
        // Handle leading zeros
        if Evaluate(Num, NumStr) then begin
            Num := Num + Increment;
            NewNumStr := Format(Num);
            
            // Pad with zeros to maintain original length
            while StrLen(NewNumStr) < OriginalLength do
                NewNumStr := '0' + NewNumStr;
            
            Prefix := CopyStr(SerialNo, 1, i);
            exit(Prefix + NewNumStr);
        end;
        
        // Fallback if evaluation fails
        exit(SerialNo);
    end;

    local procedure HasNumericEnding(SerialNo: Code[50]): Boolean
    var
        i: Integer;
    begin
        i := StrLen(SerialNo);
        while (i > 0) and (SerialNo[i] in ['0'..'9']) do
            i := i - 1;

        exit(i < StrLen(SerialNo));
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateSerialNoInformation(ItemNo: Code[20]; VariantCode: Code[10]; SerialNo: Code[50]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCreateSerialNoInformation(var SerialNoInformation: Record "Serial No. Information")
    begin
    end;
}