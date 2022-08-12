program TABL;
const p = 10;
type 
T = array[1..p] of integer;
TT = record 
    neg,pos:integer;
end;    
//==============
function somTabpos(TAB:T;N:integer):integer;
begin 
if(TAB[N] < 0)then TAB[N] := 0;
if(N=1) then somTabpos := TAB[1] else somTabpos := somTabpos(TAB,N-1) + TAB[N];
end;
// ==========
function somTab(TAB:T;N:integer):TT;
function somTabneg(TAB:T;N:integer):integer;
begin 
if(TAB[N] > 0)then TAB[N] := 0;
if(N=1) then somTabneg := TAB[1] else somTabneg := somTabneg(TAB,N-1) + TAB[N];
end;
begin
    somTab.pos := somTabpos(TAB,N);
    somTab.neg := somTabneg(TAB,N);
 end;  
// ========================================================
// ===========================PROGRAM======================
// ========================================================
var TAB:T; i:integer;
begin 
writeln(' Remplir la table : '); for i:=1 to p do 
    begin
    write(' ===> ');
    readln(TAB[i]);
    end;
     writeln(' DONE ');
     writeln(' somme des nombre POSITIVE ( autre fonction ) : ',somTab(TAB,p).pos);
     writeln(' somme des nombre négative : ',somTab(TAB,p).neg);
end.