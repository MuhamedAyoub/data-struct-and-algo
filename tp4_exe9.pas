program recursion;
// ============== perm int =====
procedure perm(var a,b:char);
var c:char;
begin   
c:=a;
a:=b;
b:=c;
end;  

// ==========     
procedure differentes_combinaisons(var chaine:string;s,e:integer);
var 
i:integer;
begin 
    if(s=e) then writeln(chaine)
    else
     for i:=s to e do 
        begin
        perm(chaine[s],chaine[i]);
        differentes_combinaisons(chaine,s+1,e);
        perm(chaine[s],chaine[i]);
        end;
 END;  
// =====================   
var e,s,s1:string;
begin 
    write('==>');
    readln(s);
    differentes_combinaisons(s,1,length(s));
    end.