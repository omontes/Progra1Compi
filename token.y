/**Define la gramatica **/

%{
    int count;
    
%}

%token ID OTRO STOP NUM NUEVALINEA ESPACIOENBLANCO

%%
start :
    | start something
    ;

something : NUM {printf("NUM ");}
    | ID {    count++;
                    printf("VAR ");}
    | NUEVALINEA {printf("NUEVALINEA\n");}
    | ESPACIOENBLANCO{printf("ESPACIOS ");}
    | OTRO {printf("OTRO ");}
    | STOP {    printf("cant vars = %d\n",count);
                exit(0);}
                
                
        ;
%%


