
PROGRAM problem_41;
{$mode ObjFPC}{$H+}

USES  Classes, SysUtils;

CONST 
  max = 7654321;


TYPE 
  tThingRec = RECORD
    ch  : Char;
    occ : Boolean;
  END;

VAR 
  Thing       : Array[1..255] OF tThingRec;
  EntryString : String;
  primestrs : TStringList;
  is_prime: ARRAY[2..max] OF boolean;


PROCEDURE Permutate(num : Byte);

VAR 
  i : Byte;
  prim : string;
BEGIN
  IF num > length(EntryString) THEN
    BEGIN
      num := 1;
      prim := '';
      FOR i := 1 TO length(EntryString) DO
        prim := prim + Thing[i].Ch;
      primestrs.add(prim);
    END
  ELSE
    BEGIN
      FOR i := 1 TO length(EntryString) DO
        BEGIN
          IF (NOT Thing[i].Occ) THEN
            BEGIN
              Thing[i].Occ := True;
              Thing[i].Ch := EntryString[num];
              Permutate(succ(num));
              Thing[i].Occ := False;
            END;
        END;
    END;
END;

PROCEDURE createSieve(max_prime : longint);

VAR i,j : longint;
BEGIN
  FOR i := 2 TO max_prime DO
    is_prime[i] := True;
  FOR i := 2 TO max_prime DO
    BEGIN
      IF (is_prime[i]) THEN
        FOR j := 2 TO (max_Prime DIV i) DO
          is_prime[i * j] := False;
    END;
END;


VAR i : longint;
BEGIN
  CreateSieve(high(is_prime));
  primestrs := TStringList.Create;

  primestrs.sorted := true;
  primestrs.Duplicates := dupIgnore;
  FillChar(Thing,sizeof(Thing),0);
  EntryString := '1234567';
  //pandigitals 1-8 and 1-9 are divisible by 3
  Permutate(1);
  FOR i := pred(primestrs.count) DOWNTO 0 DO
    IF is_prime[strtoint(primestrs[i])] THEN
      BEGIN
        writeln(primestrs[i]);
        break;
      END;
END.
