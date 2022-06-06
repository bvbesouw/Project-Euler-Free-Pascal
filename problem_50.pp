
PROGRAM problem_50;

{$mode ObjFPC}{$H+}

USES fgl;

CONST max = 1000000;

TYPE 
  TIntegerList = Specialize TfpgList<longint>;

VAR 
  primes: TIntegerList;
  i,j,longest,largest,sum: longint;
  isprime : array[2..max] OF boolean;

BEGIN
  primes := TIntegerList.Create;
  FOR i := 2 TO max DO
    isprime[i] := True;

  FOR i := 2 TO max DO
    // apply sieve
    BEGIN
      IF (isprime[i]) THEN
        FOR j := 2 TO (max DIV i) DO
          isprime[i * j] := False;
    END;
  FOR i := low(isprime) TO high(isprime) DO
    IF isprime[i] THEN primes.add(i);

  longest := 0;
  largest := 0;
  FOR i := 0 TO pred(primes.count) DO
    BEGIN
      sum := 0;
      FOR j := i+1 TO pred(primes.count) DO
        BEGIN
          inc(sum,primes[j]);
          IF sum > max THEN break;
          IF (isprime[sum]) AND (j-i > longest) THEN
            BEGIN
              longest := j-i;
              largest := sum;
            END;
        END;
    END;
  writeln(largest);
END.
