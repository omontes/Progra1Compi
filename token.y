/**Define la gramatica **/

%{
    int count;
    void yyerror(char *s);
%}

%token ID STOP NUM NUEVALINEA ESPACIOENBLANCO

%%
/*start :
    | start something
    ;

something : NUM {printf("NUM ");}
    | ID {    count++;
                    printf("VAR ");}
    | NUEVALINEA {printf("NUEVALINEA\n");}
    | ESPACIOENBLANCO{printf("ESPACIOS ");}
    | STOP {    printf("cant vars = %d\n",count);
                yywrap();}
                
                
        ;*/
        
start :
                start expr NUEVALINEA   {printf("%d\n",$2);}
                | start termino   
                | 
                ;
expr:
                NUM {$$=$1;}
                | expr '+' expr {$$= $1 + $3;}
                | expr '-' expr {$$= $1 - $3;}
                
                ;
termino:        
                STOP {exit(0);} 
                ;
                

        
%%
void yyerror(char *s){
    
    printf("error sintactico: %s\n",s);
}


