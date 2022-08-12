program Fibonnacci;

//=====================Fibo ====================    
function Fibo(N:integer):integer;
begin 
        if(N=0) then Fibo:=0 else if(N=1) then Fibo:=1 else Fibo:=Fibo(N-1) + Fibo(N-2);
end;
// ============
var n:integer;
begin

    write(' ENTRER NOMBER POSITIVE N : '); readln(n);
    writeln(' Fibonnacci = ',Fibo(n));
   end.
