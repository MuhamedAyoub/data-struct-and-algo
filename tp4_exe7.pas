program cherche;
const p = 10;
type 
T = array[1..p] of integer;
// exo 7 ====================================
  function exite(TAB:T;size,c:integer):boolean;
begin
    if(size = 1) then exite:= (TAB[1] = c) else 
begin
    if(TAB[size] = c) then exite:=true 
    else  exite := exite(TAB,size - 1,c);
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
  writeln(' entre un nomber pour le recherche : '); write('==>'); readln(i);
  if(exite(TAB,p,i)) then writeln('Ce numéro existe. ') else writeln('Ce numéro ne existe pas.');
END.        