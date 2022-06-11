program problem_47;
{$mode ObjFPC}{$H+}
uses fgl,sysutils;
TYPE
  TIntegerList = Specialize TfpgList<integer>;

VAR 
  list: Tintegerlist;

function BinarySearch(X: integer; var indx: integer): boolean;
var
top, bottom, middle,toosmall,i :integer; 
found : boolean;
begin
  top := pred(list.count);
  bottom := 0;
  found := false;
  indx := -1;
  repeat
    middle := (top + bottom) div 2;
    if (list[top] = x) or (list[middle]= x) or (list[bottom]=x) then
    begin
      found := true;
      if list[top] = x then indx := top else
      if list[middle] = x then indx := middle else
      indx:= bottom;
    end;
    toosmall := top - bottom;
    if x > list[middle] then bottom := middle else top:= middle;
  until (found or (toosmall < 3));
  result := found;
  if not found then
  begin
    indx := top;
    while list[indx] > x do dec(indx);
    inc(indx);
  end;
end;

procedure AddToList(x : integer);
var ix : integer;
begin
  if list.count = 0 then list.add(x) else 	
    if x > list[pred(list.count)] then list.add(x) else
      if x < list[0] then list.insert(0,x) else
        if not BinarySearch(x,ix) then list.insert(ix,x);
end;




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
          AddToList(i);
          dec(i);
        END;
      inc(i);
    END;
  result := succ(list.count);
END;

VAR 
  j: Integer;

BEGIN
  list := Tintegerlist.Create;

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
