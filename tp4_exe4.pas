program StringINV;

// ==================exo 4 ========
 function inv(S:string;size:integer):string;
begin
if(size = 1) then inv := S[1] else inv:= S[size] + inv(S,size -1 )  ;
 end;  
 // ========================================================
// ===========================PROGRAM======================
// ======================================================== 
var s:string;
begin
  
       write(' etnre une chaine : ');readln(s);
        writeln(' inv de cette chaine est : ',inv(s,length(s)));
 end.       