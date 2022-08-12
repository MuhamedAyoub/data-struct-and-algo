PROGRAM Palinrome;
// ================== EXO 5 ===============
 function palinrome(S:string;halfsize:integer):boolean;
 begin
 if(halfsize = 1) then palinrome := S[1] = S[length(S)]
 else palinrome := (palinrome(S,halfsize - 1) and (S[halfsize] = S[length(S) - halfsize +1 ]))
 end;
 // ========================================================
// ===========================PROGRAM======================
// ======================================================== 
var s:string;
begin
  
   write(' etnre une chaine : ');readln(s);
  if(palinrome(s,length(s)div 2)) then write(' cette chaine est palinrome .') else write('cette chaine ne est pas palinrome');
 end. 
