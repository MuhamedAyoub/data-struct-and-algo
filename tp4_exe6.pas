program MAXTAB;
const p = 10;
type 
T = array[1..p] of integer;
// exo 6 ================================
 function maxTAB(TAB:T;size:integer):integer;
var tmp:integer;
begin 
    
    if(size = 1) then maxTAB:=TAB[1] else 
        begin
        tmp := maxTAB(TAB,size - 1);
            if(TAB[size] > tmp ) then maxTAB := TAB[size] else maxTAB := tmp;
        end; 
        
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
    writeln(' max val de cette table :',maxTAB(TAB,p));
 end.   
