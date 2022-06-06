
PROGRAM problem_3;

CONST 
  max_number = 548112;
  // sqrt(600851475143 div 2);

VAR 
  is_prime: ARRAY [2 .. max_number] OF boolean;

FUNCTION isprime(n: uint64): boolean;

VAR 
  i     : longint;
  iprime: boolean;

BEGIN
  i := 3;
  isprime := odd(n);
  IF n < 548112 THEN
    iprime := is_prime[n]
  ELSE
    WHILE iprime AND ((i * i) < n) DO
      BEGIN
        IF NOT is_prime[n] THEN
          REPEAT
            Inc(i)
          UNTIL is_prime[i];
        iprime := NOT(n MOD i = 0);
      END;
  isprime := iprime;
END;

VAR 
  lin, i, j, lcnt, max: uint64;

BEGIN
  max := 0;
  lin := 600851475143;
  lcnt := 2;
  FOR i := 2 TO max_number DO
    // initialize sieve;
    is_prime[i] := True;

  FOR i := 2 TO max_number DO
    // apply sieve
    BEGIN
      IF (is_prime[i]) THEN
        FOR j := 2 TO (max_number DIV i) DO
          is_prime[i * j] := False;
      // mark all multiples up to n as being not prime}
    END;
  WHILE lcnt * lcnt <= lin DO
    BEGIN
      IF lin MOD lcnt = 0 THEN
        IF isprime(lcnt) AND (lcnt > max) THEN
          max := lcnt;
      lcnt := lcnt + 1;
    END;
  writeln(max);
END.
