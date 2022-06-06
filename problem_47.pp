
PROGRAM problem_47;

{$mode ObjFPC}{$H+}

USES 
fgl,
classes,
sysutils;

CONST 
  mx = 1000000;

  //TYPE
  //TIntegerList = Specialize TfpgList<longint>;

VAR 
  list: Tstringlist;

FUNCTION npf(number: Integer): Integer;

VAR 
  i: Integer;
BEGIN
  i := 2;
  list.clear;
  WHILE (i < sqrt(number)) OR (number = 1) DO
    BEGIN
      IF number MOD i = 0 THEN
        BEGIN
          number := number DIV i;
          list.add(inttostr(i));
          dec(i);
        END;
      inc(i);
    END;
  result := succ(list.count);
END;

VAR 
  j: Integer;

BEGIN
  list := Tstringlist.Create;
  list.sorted := true;
  list.duplicates := dupIgnore;
  j := 2 * 3 * 5 * 7;
  WHILE True DO
    BEGIN
      IF (npf(j) = 4) AND (npf(j + 1) = 4) AND (npf(j + 2) = 4) AND
         (npf(j + 3) = 4) THEN
        BEGIN
          writeln(j);
          break;
        END;
      inc(j);
    END;
  list.Free;
END.
