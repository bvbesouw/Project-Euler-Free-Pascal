
PROGRAM problem_49;

{$mode ObjFPC}{$H+}

USES euler,sysutils;

CONST max_number = 10000;

VAR is_prime: ARRAY[2..max_number] OF boolean;
  i,j,x,addnumber: integer;
  found : boolean;

BEGIN
  FOR i := 2 TO max_number DO
    is_prime[i] := true;
  //initialize sieve;

  FOR i := 2 TO max_number DO
    //apply sieve
    BEGIN
      IF (is_prime[i]) THEN
        FOR j := 2 TO (max_number DIV i) DO
          is_prime[i*j] := false;
    END;

  x := 1487;
  REPEAT
    inc(x,2);
    addnumber := 1;
    WHILE (x + 2*addnumber) < max_number DO
      BEGIN
        IF is_prime[x] AND is_prime[x+addnumber] AND is_prime[x+2*addnumber] THEN  //check for primarity
          IF (sort_number(x) = sort_number(x+addnumber)) AND  (sort_number(x) = sort_number(x+2*addnumber)) THEN //check for permutation
            BEGIN
              writeln(inttostr(x)+inttostr(x+addnumber)+inttostr(x+2*addnumber));
              found := true;
              break;
            END;
        inc(addnumber);
      END;
  UNTIL found;
END.
