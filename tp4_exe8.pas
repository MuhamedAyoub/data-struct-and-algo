program INVTAB;
const p = 10;
type 
T = array[1..p] of integer;
// ============== perm int =====
procedure perm(var a,b:integer);
var c:integer;
begin   
c:=a;
a:=b;
b:=c;
end;  
// =========================EXO 8 =============
procedure invTAB(var TAB:T;index:integer);
begin 
    if(index = 1) then  perm(TAB[1],TAB[10]) else 
    begin 
        perm(TAB[index],TAB[10 - index +1]);
        invTAB(TAB,index - 1);
    end;    
end;      
// ========================================================
// ===========================PROGRAM======================
// ======================================================== 
var TAB:T; i:integer;
begin 
writeln(' Remplir la table : ');
for i:=1 to p do 
    begin
        write(' ===> ');
        readln(TAB[i]);
    end;
writeln(' DONE ');
invTAB(TAB,p div 2);
for i:=1 to p do writeln(' ==> ',TAB[i]);
writeln;
END.