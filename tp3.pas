program base_donnee;
uses crt;
// studnet type    
type     
studentptr = ^student;
student = record 
    nom,prenom:string;
    next:studentptr;
end;    
// ============== 
// year type     
type  
yearsptr = ^years;
years = record 
    nom :string;
    next: yearsptr;
    branch : studentptr;
    end;
// ===========   
// speciality type
type 
specialityptr = ^speciality;
speciality = record
    nom:string;
    next:specialityptr;
    branch:yearsptr;
    end;
// =========  
// Departement type     
type     
departmentptr = ^department;
department = record 
    nom : string;
    next : departmentptr;
    branch : specialityptr;
end;
// ==========
// faculty type
type     
facultyptr = ^faculty;
faculty = record
      nom :string;
    next:facultyptr;
    branch:departmentptr;
    end;
// ===============    

// university type
type 
universityptr = ^university;
university = record 
    nom:string[30];
    next:universityptr;
    branch:facultyptr;
    end;
// ================
    
// ============================== Fin type =========================================
//==================================================================================
//==================================================================================
// ============================================================ transition ========================================================================
function transition_university(unv:universityptr):universityptr;
var 
    ux:universityptr; change:char; 
    begin 
        change:='A';    
         ux:=unv;
             if(ux<>nil) then 
        begin
              writeln('Cette universite s"appelle ',ux^.nom);
              repeat               
                if(ux^.next<>nil) then begin  Write('Si vous voulez changer d"universite cliquez sur " Y " ::  '); Readln(change);
                    if((change='Y')or(change='y')) then  begin
                        ux:=ux^.next;
                     writeln('Cette universite s"appelle ',ux^.nom); writeln; end; end;
               until(change<>'Y')and(change<>'y')or(ux^.next=nil);
              transition_university := ux;
     end;  
   END;          
 // =================================== transition_Faculte ==========================
  function transition_faculty(unv:universityptr):facultyptr;
var 
    ux:universityptr; change:char; fac:facultyptr;
 begin 
        change:='A';
    transition_faculty:=nil;
         ux:=transition_university(unv);
    if(ux <> nil) then
        if(ux^.branch<>nil) then

       begin
             fac := ux^.branch;
                writeln('Cette faculte s"appelle ',fac^.nom);
           
              repeat          
                  if(fac^.next<>nil) then begin  Write('Si vous voulez changer faculte cliquez sur " Y " :: '); Readln(change);
                    if((change='Y')or(change='y')) then begin 
                        fac:=fac^.next;
                        writeln('Cette faculte s"appelle ',fac^.nom); end; end;
                until((change<>'y')and(change<>'Y'))or(fac^.next=nil);
                 transition_faculty := fac;
           
            
       end; 
END;
// =================================== transition_Departement  ==========================
function transition_Departement(unv:universityptr):departmentptr;
var 
     fac:facultyptr; dp:departmentptr; change:char;
begin 
     transition_Departement:=nil;
        change:='A';
         fac := transition_faculty(unv);
         if( fac <> nil) then if(fac^.branch<>nil) then 
         begin
                      dp := fac^.branch;
                    writeln('Cette Departement  s"appelle ',dp^.nom); 
                        repeat
                        if(dp^.next<>nil)  then begin Write('Si vous voulez changer Departement cliquez sur " Y " :: '); Readln(change);
                          if((change='Y')or(change='y')) then begin 
                              dp:=dp^.next;
                              writeln('Cette Departement s"appelle ',dp^.nom); end; end;
                       until(change<>'y')and(change<>'Y')or(dp^.next=nil);
                         transition_Departement:=dp;
           end; 
 END;                      
// =================================== transition_specialite ==========================
function transition_speciality(unv:universityptr):specialityptr;
var 
 dp:departmentptr;sps:specialityptr; change:char;
begin
        change:='A';
        transition_speciality:=nil;
          dp := transition_Departement(unv);
           if( dp <> nil) then if(dp^.branch<>nil) then 
             begin 
                 sps := dp^.branch;
                writeln('Cette speciality  s"appelle ',sps^.nom);
                   repeat
                     if(sps^.next <> nil) then begin Write('Si vous voulez changer Speciality cliquez sur " Y " :: '); Readln(change);
                            if((change='Y')or(change='y')) then begin 
                               sps:=sps^.next;
                              writeln('Cette Speciality s"appelle ',sps^.nom); end; end;
                    until(change<>'y')and(change<>'Y')or(sps^.next=nil);
             transition_speciality:=sps;
         end;
 END;          
// =================================== transition_annee ==========================
function transition_years(unv:universityptr):yearsptr;
var 
     yr:yearsptr;sps:specialityptr; change:char;
begin 
    transition_years := nil;
         sps := transition_speciality(unv);
         if( sps <> nil) then if(sps^.branch <>nil) then 
            begin 
                     yr:=sps^.branch;
                     writeln('Cette annee  est  ',yr^.nom);

                      repeat
                      if(yr^.next<>nil)  then begin  Write('Si vous voulez changer annee cliquez sur " Y " :: '); Readln(change);
                                if((change='Y')or(change='y')) then begin 
                                   yr:=yr^.next;
                                  writeln('Cette annee est : ',yr^.nom); end; end;
                      until((change<>'y')and(change<>'Y'))or(yr^.next=nil);
                      transition_years:=yr;
         end;

 END;              
//================================================================= creation ========================================================
// ===================================== creation university ==========
//====================================================================    
procedure creat_university(var unv:universityptr);
var x:universityptr;i,p:integer;
begin 
     repeat writeln('Combien voulez-vous creer ? '); write('==> '); readln(p); until(p>0);

  x := unv;
  if(unv<>nil) then 
  begin
     While(x^.next<>nil)Do x:=x^.next;
     NEW(x^.next);
     x:=x^.next;
     x^.next:=nil;
     x^.branch:=nil;
     write('Entrez le nom d"university : ');
         readln(x^.nom);
     
 end
 else 
    begin
    	            NEW(unv);
        unv^.next:=nil;
        unv^.branch:=nil;
        write('Entrez le nom d"university : ');
            readln(unv^.nom);
            x:=unv;
        end;
          i:=3;
    while(i<=p) do  
        begin
              NEW(x^.next);
              x:=x^.next;
              x^.next:=nil;
              x^.branch:=nil;
              write('Entrez le nom de university  : ');
              readln(x^.nom);
              i:=i+1;
         end;     
  End;
// ===================================== creation faculty ==========

procedure creat_faculty(var unv:universityptr);
var y:facultyptr; ux:universityptr; i,p:integer;
begin
     repeat writeln('Combien voulez-vous creer ? '); write('==> '); readln(p); until(p>0);
if(unv = nil) then 
    begin
       writeln('cree votre university d abord');
       creat_university(unv);
     end;
    ux := transition_university(unv);
    y:=ux^.branch;
       if(ux^.branch = nil) then 
        begin
                            NEW(ux^.branch);    y:=ux^.branch;
          end                 
                   
        else 
        begin 
        	While( y^.next <> nil) do y:=y^.next;
        	NEW(y^.next);
        	y:=y^.next;
            y^.next:=nil;
             y^.branch:=nil; end; 
             
 write('Entrez le nom de la faculty : ');
readln(y^.nom);
    i:=2;
    while(i<=p) do  
        begin
              NEW(y^.next);
              y:=y^.next;
              y^.next:=nil;
              y^.branch:=nil;
              write('Entrez le nom de la faculty : ');
              readln(y^.nom);
              i:=i+1;
         end;   
end;
// ===================================== creation departement ==========
procedure creat_department(var unv:universityptr);
var 
y:departmentptr; fac:facultyptr;i,p:integer;
begin 

     repeat writeln('Combien voulez-vous creer ? '); write('==> '); readln(p); until(p>0);
    if(unv = nil) then 
    begin
       writeln('cree votre universite  et faculte d"abord');
       creat_faculty(unv);
     end 
     else if(unv^.branch = nil) then 
     begin
     write(' cree vote faculte d"abord');
       creat_faculty(unv);
    end;
       fac:= transition_faculty(unv);
 if(fac^.branch = nil) then
    begin
         NEW(fac^.branch);
                 y:=fac^.branch;
        end
else 

    begin
        While(y^.next<> nil) do y:=y^.next;

        NEW(y^.next);
            y:=y^.next;
        y^.next:=nil;
            y^.branch:=nil;
         end;   
 write('Entrez le nom de la departement : ');
readln(y^.nom);
    i:=2;
    while(i<=p) do  
        begin
              NEW(y^.next);
              y:=y^.next;
              y^.next:=nil;
              y^.branch:=nil;
              write('Entrez le nom de la departement : ');
              readln(y^.nom);
              i:=i+1;
         end;   

     end; 
// ===================================== Crrer specialite  ==========
procedure creat_speciality(var unv:universityptr);
var 
y: specialityptr;yr:yearsptr; i,j,p:integer; dp:departmentptr;
begin 
         repeat writeln('Combien voulez-vous creer ? '); write('==> '); readln(p); until(p>0);

    if(unv = nil) then 
        begin
            writeln('cree votre universie  et faculte et departement d"abord');
            creat_department(unv);
        end 
     else if(unv^.branch = nil) then 
         begin
            write(' cree vote faculte  et departement d"abord');
            creat_department(unv);
           end
     else if(unv^.branch^.branch = nil) then 
           begin
                write(' cree vote departement d"abord');
             creat_department(unv);
            end;
 dp:=transition_Departement(unv);
 if(dp^.branch = nil) then
    begin
         NEW(dp^.branch); y:=dp^.branch;
    end
            else 
    begin
        While(y^.next<> nil) do y:=y^.next;

        NEW(y^.next);
            y:=y^.next;
        y^.next:=nil;
            y^.branch:=nil;
         end;   
 write('Entrez le nom de la speciality  : ');
readln(y^.nom);
NEW(y^.branch);
    yr:=y^.branch;
     yr^.next:=nil; yr^.branch:=nil;
     yr^.nom := 'L1';
    for i:=2 to 5 do 
      begin
        NEW(yr^.next);
                yr:=yr^.next;
        yr^.next:=nil; yr^.branch:=nil;
        if(i < 4) then yr^.nom := 'L'+chr(i+48)
        else yr^.nom := 'M'+chr(i-3+48);
      end;
      j:=2;
    while(j<=p) do  
        begin
              NEW(y^.next);
              y:=y^.next;
              y^.next:=nil;
              y^.branch:=nil;
              write('Entrez le nom de la speciality : ');
              readln(y^.nom);
              j:=j+1;
                NEW(y^.branch);
                 yr:=y^.branch;
                 yr^.next:=nil; yr^.branch:=nil;
                 yr^.nom := 'L1';
                    for i:=2 to 5 do 
                         begin
                        NEW(yr^.next);
                        yr:=yr^.next;             
                        yr^.next:=nil; yr^.branch:=nil;
                        if(i < 4) then yr^.nom := 'L'+chr(i+48)
                            else yr^.nom := 'M'+chr(i-3+48);
                        end;

         end;   

end;       
// ================================================================================================

// ===================================== Rechercher university ==========

 function search_unversity(var unv:universityptr;university_name:string):universityptr;
var  x:universityptr;
begin 
x:=unv;
     search_unversity:=nil;
     if(unv <> nil) then 
     begin   
        While(x^.next<>nil)and(x^.nom <> university_name) do x:=x^.next;
        if(x^.nom = university_name) then 
            search_unversity := x;
      end;      
end;  
// ===================================== Rechercher une faculty  ==========
function search_faculty( unv:universityptr;university_name,faculty_name:string):facultyptr;
var
y:facultyptr;x:universityptr; 
begin 
y:=nil;
    x:=search_unversity(unv,university_name);
    if(x <> nil) then  if(x^.branch <> nil) then    
        begin
        y:=x^.branch;
                 While(y<>nil)and(y^.nom<> faculty_name) do y:=y^.next;
         end;
     search_faculty:= y;

end;
// ===================================== Rechercher un departement  ===============
function search_department(unv:universityptr;university_name,faculty_name,department_name:string):departmentptr;
var 
fc:facultyptr; dp:departmentptr;
begin
    dp:=nil;
    fc:=search_faculty(unv,university_name,faculty_name);
    if(fc <> nil) then dp:=fc^.branch;
    if(dp<>nil) then While(dp<>nil) and (dp^.nom <> department_name) do dp:=dp^.next;                                                                                   
    search_department:=dp;            
end;                    
// ================================================================================================
// ==============================================Rechercher une speciality==================================================
function search_speciality(unv:universityptr;university_name,faculty_name,department_name,speciality_name:string):specialityptr;
var 
dp:departmentptr; sp:specialityptr;
begin 
    sp:=nil;
    dp:=search_department(unv,university_name,faculty_name,department_name);
    if(dp<>nil) then sp:=dp^.branch;
    if(sp<>nil) then While(sp<>nil) and (sp^.nom <> speciality_name) do sp:=sp^.next;     
    search_speciality := sp;                   
end;                    

//===================================================================================
// ===============================================creat student =================================================
procedure creat_sudents(var unv:universityptr;university_name,faculty_name,department_name,speciality_name,year:string);
var
yr:yearsptr; code:char; st:studentptr; sps:specialityptr;
 begin
     sps := search_speciality(unv,university_name,faculty_name,department_name,speciality_name);
if(sps <> nil) then
  if(sps^.branch<>nil) then 
           begin
                   yr:=sps^.branch;
                   if(year = 'L2') then yr:=yr^.next else if( year='L3')then yr:=yr^.next^.next
                  else if(year='M1') then yr := yr^.next^.next^.next
                     else if( year = 'M2') then yr := yr^.next^.next^.next^.next;
                  if(yr^.branch = nil)  then
                      begin
                          NEW(yr^.branch);
                          st:=yr^.branch;
                           st^.next:=nil;
                          write('Entez le nom d"Etudiant : ');
                         readln(st^.nom);
                         write('Entez le prenom d"Etudiant : ');
                            readln(st^.prenom); 
                             write('Cliquez sur la lettre S pour arreter la creation : '); readln(code); writeln;
                     end      
                else 
                begin
                  st:=yr^.branch;              
                  while(st^.next<>nil) do st:=st^.next;  
                 end;                    
                
             while(code <> 'S') and (code <>'s') do
             begin
                          NEW(st^.next);
                            st:=st^.next;
                       st^.next:=nil;
                  write('Entez le nom d"Etudiant : ');
                     readln(st^.nom);
                    write('Entez le prenom d"etudiant : ');
                readln(st^.prenom); 
                 write('Cliquez sur la lettre S pour arreter : '); readln(code); writeln;
        
             end; 
    end;      
 end;   
// ====================== Rechercher Etudiant dans l'university =======================
function search_student(var unv:universityptr;university_name,student_name,student_prenom:string;var fac:facultyptr; var depart:departmentptr; var spes:specialityptr; var year:yearsptr;var std:studentptr):boolean;
var 
    x:universityptr; fc:facultyptr; dp:departmentptr; sps:specialityptr;yr:yearsptr;st:studentptr; b:boolean;
    begin 
        b:=false;
        search_student:=false;
        fac:=nil;
        depart:=nil;
        spes:=nil;
        year := nil;
        std := nil;
    x:=search_unversity(unv,university_name);
    if(x<> nil ) then 
        begin
             fc:=x^.branch;
                While(fc <> nil)and(not b) do 
                begin
                    dp:=fc^.branch;
                    While(dp<> nil) and (not b) do 
                    begin
                        sps:=dp^.branch;
                        While(sps<>nil) and(not b) do 
                        begin
                            yr:=sps^.branch;
                            While(yr<>nil)and(not b) do 
                            begin
                                st:=yr^.branch;std:=st;
                                While(st^.next<> nil)and((st^.nom <> student_name)or(st^.prenom <> student_prenom)) do begin std:=st; st:=st^.next;  end;
                                if(st^.nom = student_name)and(st^.prenom = student_prenom) then b:=true
                                else yr:=yr^.next;
                            end;
                        if(not b) then sps:=sps^.next;
                        end;
                    if(not b) then dp:=dp^.next;
                    end;
                if(not b) then fc:=fc^.next;
                end;
            end;    
       if(b) then
        begin
       search_student:=true;
        fac:=fc;
        depart:=dp;
        spes:=sps;
        year := yr;
        end;

end;    
// =======================================Supprimer une faculty==============================================
procedure delete_faculty( var unv:universityptr; university_name,faculty_name:string);
var 
fac,fx:facultyptr; b:boolean;x:universityptr; dp:departmentptr; sps:specialityptr; yr:yearsptr;
begin 
b:=false;
        x:=search_unversity(unv,university_name);
            if(x<>nil) then
            begin
            fac:=x^.branch; fx:=nil;
            while(fac^.next<>nil)and(fac^.nom<>faculty_name) do begin fx:=fac; fac:=fac^.next; end;
            b:= fac^.nom = faculty_name;
        end;
        if(b) then 
        begin
         b:=false;
             dp:=fac^.branch; if(dp=nil) then b:=true
             else 
                      While(dp^.next<>nil) and(not b) do 
                         begin
                                 sps:=dp^.branch; if(sps=nil) then b:=true;
                                While(sps<>nil) and(not b) do 
                                  begin
                                        yr:=sps^.branch;  if(yr=nil) then b:=true
                                    else
                                     begin   
                                           While(yr^.next<>nil)and(yr^.branch = nil) do 
                                             yr:=yr^.next;
                                             if(yr^.next = nil) and (yr^.branch = nil)  then  b:=true
                                             else sps:=sps^.next;            
                                      end;
                             end;
                        if(not b) then  dp:=dp^.next; 
                     end;  
              
         end;
            
if(b) then
begin
     if(fx = nil) then 
            begin
         x^.branch:=x^.branch^.next;
          DISPOSE(fac); fac:=nil;
          writeln(' ** DONE **');                                               
              end
                else
              begin   
                  fx^.next := fac^.next;
                 DISPOSE(fac);
                fac:=nil;
                   writeln(' ** DONE **');                
            end;
 end;
  END;             
 // =======================================Supprimer un departement==============================================
procedure delete_department(var unv:universityptr;university_name,faculty_name,department_name:string);
 var dp,dx:departmentptr; b:boolean; fac:facultyptr; sps:specialityptr; yr:yearsptr;
 begin 
 b:=false;
   fac := search_faculty(unv,university_name,faculty_name);
        if(fac<>nil) then 
            begin
                dp:=fac^.branch; dx:=nil;
              if(dp<>nil) then  while(dp^.next<>nil)and(dp^.nom<>department_name) do begin dx:=dp;dp:=dp^.next; end;
            end;
            b:= dp^.nom=department_name;
if(b) then 
  begin
    b:=false;
    sps:=dp^.branch;if(sps = nil) then b:=true
    else
       While(sps<>nil) and(not b) do 
            begin
                         yr:=sps^.branch;  if(yr=nil) then b:=true
                           else
                                While(yr^.next<>nil)and(yr^.branch = nil) do 
                                  yr:=yr^.next;
                                 if(yr^.next = nil) and (yr^.branch = nil)  then  b:=true
                                      else sps:=sps^.next;            
                             
               end;
           if(b) then  
           if(dx = nil) then
            begin
                   dp:=fac^.branch;
                    fac^.branch:=dp^.next;
                   DISPOSE(dp); dp:=nil;
                     writeln(' ** DONE **');                                             
              end
            else
                   begin   
                    dx^.next:=dp^.next;
                   DISPOSE(dp);
                       dp:=nil;
                    writeln(' ** DONE **');                
                    end;
               end; 
     
 end;   
 // =======================================Supprimer spiciality==============================================
procedure delete_speciality(var unv:universityptr;var university_name,faculty_name,department_name,speciality_name:string);
var  b:boolean; sps,sx:specialityptr; dp:departmentptr;  yr:yearsptr;
begin 
  b:=false;
     dp := search_department(unv,university_name,faculty_name,department_name);
        if(dp<>nil) then 
            begin
                sps:=dp^.branch; sx:=nil;
               if(sps<>nil) then  while(sps^.next<>nil)and(sps^.nom<>speciality_name) do begin sx:=sps;sps:=sps^.next; end;
            end;
            b:= dp^.nom=department_name;   
    if(b) then 
        begin
              b:=false;
             yr:=sps^.branch;  if(yr=nil) then b:=true
             else
                While(yr^.next<>nil)and(yr^.branch = nil) do 
                   yr:=yr^.next;
                 if(yr^.next = nil) and (yr^.branch = nil)  then  b:=true;
                
         end;                

           if(b) then
               begin
                     if(sx = nil) then 
                         begin
                              sps:=dp^.branch;
                             dp^.branch:=sps^.next;
                                DISPOSE(sps); sps:=nil;
                                 writeln(' ** DONE **');                     
                            end
                     else
                           begin   
                              sx^.next:=sps^.next;
                              DISPOSE(sps);
                              sps:=nil;
                             writeln(' ** DONE **');                
                          end;
               end;
     
end; 
// ==============================================Supprimer Etudiant========================================
procedure delete_student(var unv:universityptr;university_name,student_name,student_prenom:string);
var 
fac:facultyptr; dp:departmentptr; sps:specialityptr; year:yearsptr;st,st2:studentptr; b:boolean;
begin 
    dp:=nil;fac:=nil;sps:=nil;year:=nil;st:=nil;st2:=nil;
    b:= search_student(unv,university_name,student_name,student_prenom,fac,dp,sps,year,st);
    if(b) then 
     if(st=year^.branch) then 
        begin
         year^.branch:=year^.branch^.next;
         DISPOSE(st); st:=nil;
        writeln(' ** DONE **');


        end
       else  
        begin
            st2:=st^.next;
            st^.next:=st2^.next;
            DISPOSE(st2); st2:=nil;
            writeln(' ** DONE **');
         end
      else writeln('Cet Etudiant n"existe pas .');
end;       
//====================================================Algorithme====================================================
procedure trier_bol(var st:studentptr);
var x,F:studentptr; c,v:string;
begin
    if(st<> nil) then 
        if(st^.next <> nil) then
            begin
                F:=nil;
                While(st<>F) Do
                begin
                  x:=st;
                    While(x^.next<>F) do 
                    begin
                        if(x^.nom > x^.next^.nom) then 
                        begin
                            c:=x^.nom;
                            x^.nom := x^.next^.nom;
                            x^.next^.nom := c;
                            v:=x^.prenom;
                            x^.prenom := x^.next^.prenom;
                            x^.next^.prenom := v;
                        end 
                        else if(x^.nom = x^.next^.nom)and(x^.prenom > x^.next^.prenom) then 
                                begin
                                     c:=x^.nom;
                                     x^.nom := x^.next^.nom;
                                     x^.next^.nom := c;
                                     v:=x^.prenom;
                                     x^.prenom := x^.next^.prenom;
                                     x^.next^.prenom := v;                   
                                end;
                       x:=x^.next;
                    end;
                   F:=x;
                end;
          end;     
end;            
//======================================Trier les Etudiants============================================
procedure trier(var unv:universityptr);
var 
 un:universityptr ;fac:facultyptr; dp:departmentptr; sps:specialityptr; yr:yearsptr;
begin
if(unv <> nil ) then 
    begin
          un:=unv;
       While(un<>nil) do 
           begin
              fac:=un^.branch;
                  While(fac<>nil) do 
                      begin
                       dp := fac^.branch;
                       While(dp<>nil) do 
                        begin
                          sps := dp^.branch;
                          While(sps<>nil) do 
                              begin
                                  yr:=sps^.branch;
                                  While(yr<> nil) do 
                                      begin
                                          trier_bol(yr^.branch);
                                          yr:=yr^.next;
                                       end;
                                 sps:=sps^.next;
                              end;
                          dp:=dp^.next;
                        end;    
                       fac:=fac^.next;
                     end;                  
                  un:=un^.next;
         end;  
    end;
end;
//==================================================DISPLAY======================================================
procedure DISPLAY(unv:universityptr);
var ux:universityptr ;fac:facultyptr; dp:departmentptr; sps:specialityptr; yr:yearsptr;st:studentptr;
begin 
    ux:=unv;             ClrScr;

  if(unv<> nil) then   
   begin
       While(ux<>nil) do 
            begin
            writeln(' *================================= Bienvenue a University ',ux^.nom,' =================================*');
            fac:=ux^.branch;
             While(fac<>nil) do  
               begin
                   writeln('**************************   Faculty : ',fac^.nom,'   ************************** ');
                       dp:=fac^.branch;
                        while(dp<>nil)do 
                      begin
                          writeln('------------------    Departement de ',dp^.nom,'    ------------------');
                             sps:=dp^.branch;
                                 while(sps<>nil) do
                                     begin
                                         writeln('############ Specialite do :',sps^.nom,'   ###########');  
                                            yr:=sps^.branch;
                                            while(yr<>nil) do 
                                            begin
                                                 writeln('&&&&&&  Annee do :',yr^.nom,'   &&&&&&&'); 
                                                 st:=yr^.branch;
                                                 while(st<>nil)do 
                                                    begin
                                                      writeln('__ etudiant :',st^.nom,' ',st^.prenom);
                                                      st:=st^.next;
                                                    end;
                                                 yr:=yr^.next;
                                             end; 
                                            sps:=sps^.next;
                                    end;
                                dp:=dp^.next;
                         end;
                      fac:=fac^.next;
                 end;
                 ux:=ux^.next;
             end;   
    end
    else writeln('============ l university nexiste pas .============== ');
 end;   

                                 
//========================================================================================================
//===============================================PROGRAME=================================================
//========================================================================================================
 var 
  unv:universityptr ;fx:facultyptr; dx:departmentptr; sx:specialityptr; yx:yearsptr;st:studentptr;
  university_name,faculty_name,department_name,speciality_name,year,student_name,student_prenom,e:string; n:integer;
 begin 
    ClrScr;
 writeln('************************************************   BIENVENUE   ******************************************************');
    fx:=nil;dx:=nil;sx:=nil;yx:=nil;  st:=nil; unv:=nil;
   NEW(unv);
    unv^.nom := 'DjillaliLiabes'; unv^.next:=nil; unv^.branch:=nil;
   // L'universite a ete cree
    write('Si vous voulez commencer, tapez sur ENTREE . '); readln;

 Repeat
	ClrScr; e:='';
	writeln('*****************************************************************************'); writeln;
  writeln('****Voici les operations que vous pouvez faire :');writeln;
  textcolor(14);
	writeln('##1 : Cree Universite'); 
	writeln('##2* : Cree Faculte');   
	writeln('##3* : Cree Departement'); 
	writeln('##4* : Cree Specialite');  
	writeln('##5* : Cree Etudiant'); 
	writeln('##6* : Rechercher Faculte'); 
	writeln('##7* : Rechercher Departement');
	writeln('##8* : Rechercher Specialite'); 
	writeln('##9* : Rechercher Etudiant'); 
	writeln('##10* : Supprimer Faculte'); 
	writeln('##11* : Supprimer Departement'); 
	writeln('##12* : Supprimer Specialite'); 
	writeln('##13* : Supprimer Etudiant'); 
	writeln('##14* : Trier les etudiant d"une annee d"une Specialite'); 
	writeln('##15* : Afficher les elements d"un(e): universite,faculte,Departement...etc');
	writeln('##16* : Quitter le programme');writeln;
	writeln('-----------------------------------------------------------------------------------------------');writeln;
	writeln('==> Choisissez une operation :'); write('==>'); readln(n); writeln;
    textcolor(15);
    case n of
        1:  creat_university(unv);
        2:  creat_faculty(unv);          
        3:  creat_department(unv);
        4: creat_speciality(unv);
        5: 
         begin  
            ClrScr;
                 writeln('**Dans quelle uiniversite ? :'); write('==>');
			     readln(university_name);
                 writeln('**Dans quelle faculte ? :'); write('==>');
			     readln(faculty_name); 
		    	 writeln('**Dans quelle Departement ? :'); write('==>');
		    	 readln(department_name); 
	             writeln('**Dans quelle  Specialite ? : ');write('==>');
     	         readln(speciality_name);
                    writeln('**Dans quelle  annee ? : exp(L1 , L2, L3, M1 ou M2) ');write('==>');
     	         readln(year);
                  creat_sudents(unv,university_name,faculty_name,department_name,speciality_name,year);
         end;          
 
        6:  
         begin
            writeln('Entre le nom de university :  '); write('==> ');
                Readln(university_name);
                writeln('Entre le nom de faculty :  '); write('==> ');
                readln(faculty_name);
                if(search_faculty(unv,university_name,faculty_name)<>nil) then  writeln('Cette facult�  existe.') else writeln('X Cette facult� ne existe pas . X ');
            end;
        7:
        begin
                writeln('** Entre le nom de university :  '); write('==> ');
                Readln(university_name);
                writeln('** Entre le nom de faculty :  '); write('==> ');
                readln(faculty_name);
                writeln('** Entre le nom de departement  :'); write('==>');
	    	    readln(department_name);
                if(search_department(unv,university_name,faculty_name,department_name)<>nil) then  writeln('Cette departement  existe.') else writeln(' X Cette departement ne existe pas . X ');
        end;
        8:
        begin
            ClrScr;
            writeln('** Entre le nom de university :  '); write('==> ');
                Readln(university_name);
                writeln('** Entre le nom de faculty :  '); write('==> ');
                readln(faculty_name);
                writeln('** Entre le nom de departement  :'); write('==>');
		        readln(department_name);
                writeln('** Entre le nom de la specialite  :'); write('==>');
	    	    readln(speciality_name);
                if(search_speciality(unv,university_name,faculty_name,department_name,speciality_name)<>nil) then  writeln('Cette departement  existe.') else writeln(' X Cette departement ne existe pas . X ');
        end;
        9:
        begin    
            ClrScr;
                writeln('** Entre le nom de university :  '); write('==> ');
                Readln(university_name);
                writeln('** Entre le nom d etudiant :  '); write('==> ');
                readln(student_name);
                writeln('** Entre le prenom d etudiant  :'); write('==>');
		        readln(student_prenom);
                if(search_student(unv,university_name,student_name,student_prenom,fx,dx,sx,yx,st)) then writeln('Cet etudiant etudie de la Faculty de ', fx^.nom,' dans  departement de' ,dx^.nom,' specialise en ',sx^.nom,'  de l"annee',yx^.nom);
        end;
        10:
        begin
         writeln('** Entre le nom de university :  '); write('==> ');
                Readln(university_name);
                writeln('** Entre le nom de faculty :  '); write('==> ');
                Readln(faculty_name);
                  delete_faculty(unv,university_name,faculty_name);
        end;        
        11:
    begin    
    ClrScr;
     writeln('** Entre le nom de university :  '); write('==> ');
                Readln(university_name);
                writeln('** Entre le nom de faculty :  '); write('==> ');
                readln(faculty_name);
                writeln('** Entre le nom de departement  :'); write('==>');
		        readln(department_name);
              delete_department(unv,university_name,faculty_name,department_name);
              end;
               
        12: 
        begin
         ClrScr;
            writeln('** Entre le nom de university :  '); write('==> ');
                Readln(university_name);
                writeln('** Entre le nom de faculty :  '); write('==> ');
                readln(faculty_name);
                writeln('** Entre le nom de departement  :'); write('==>');
		        readln(department_name);
                writeln('** Entre le nom de la specialite  :'); write('==>');
	    	    readln(speciality_name);
        delete_speciality(unv,university_name,faculty_name,department_name,speciality_name);
        end;
        13:
        begin   
            ClrScr;
             writeln('** Entre le nom de universite :  '); write('==> ');
                Readln(university_name);
                 writeln('** Entre le nom d etudiant :  '); write('==> ');
                readln(student_name);
                writeln('** Entre le prenom d etudiant  :'); write('==>');
	    	    readln(student_prenom);
                delete_student(unv,university_name,student_name,student_prenom);
        end;
        14:
            trier(unv);
        15:
            DISPLAY(unv);


        16: e:='Q';
        
    end;
        textcolor(28);
        writeln;
           writeln('**Si vous voulez tester une autre operation tapez une touche quelconque');//readln;
    	writeln('**Si vous voulez quitter tapez "Q" ou "q"');  write('==>'); readln(e);
       textcolor(15); 
until(e='Q')or(e='q');
ClrScr;
    textcolor(15);
    textbackground(10);
    writeln; writeln; writeln;writeln;writeln;writeln;
    writeln('==================================== Merci de visiter notre universitY =======================================');writeln;writeln;writeln;writeln;
end.

























