
PROGRAM problem_10;
{$mode ObjFPC}{$H+}

USES euler;

CONST 
  max_number = 2000000;

VAR 
  is_prime: ARRAY OF boolean;
  i       : longint;
  sum     : Uint64;

BEGIN
  SetLength(is_prime,max_number);
  Sieve(is_prime);
  sum := 0;
  FOR i := 1 TO max_number DO
    IF is_prime[i] THEN
      Inc(sum, i);
  writeln(sum);
END.
