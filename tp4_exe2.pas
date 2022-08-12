program Fibocarre;
// ===================================== carre ===============
function Fibocarre(N:integer):integer;
begin 
if(N<2) then Fibocarre:=1 else Fibocarre:= Fibocarre(N-1) +sqr(n);
end;
// ========================================================
// ===========================PROGRAM======================
// ========================================================

var n:integer;
begin 
    write(' ENTRER NOMBER POSITIVE N : '); readln(n);
    writeln('Fibo CARRE  = ',Fibocarre(n));
 end.   