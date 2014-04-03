/**Define los patterns (Expresiones regulares para el analisis lexico) **/
digito [0-9]
letra  [A-Za-z]  
%{


extern yylineno;
//Para obtener el tipo de tokens
#include "y.tab.h"
void errorLexico(char *s,int linenumber);


%}
%x COMENTARIOS
%%
"/""*"    {BEGIN COMENTARIOS;}
   
 <COMENTARIOS>\n     {printf("salto de linea: %d",yylineno);++yylineno;}   
 <COMENTARIOS>.      ;
 <COMENTARIOS>"*""/"\n {printf("esta solo: %s",yytext);BEGIN(0);}

    
 
"pare"   {printf("termino con: %s ",yytext);return STOP;}
"PARE"   {printf("termino con: %s ",yytext);return STOP;}
[-+]    return *yytext; /* devuelve el caracter que representa el - o + */
{digito}{digito}*   {printf("digito: %s ",yytext);yylval=atoi(yytext);return NUM;}
({letra}|_)(({letra}|{digito}){0,31})  {printf("%s numlinea:%d ",yytext,yylineno);return ID;}
\n      {yylineno++;return NUEVALINEA;}
[ \t\n]+  return ESPACIOENBLANCO;
.     {errorLexico(yytext,yylineno);}
%%

errorLexico(char *s, int linenumber)
{   
    printf("error lexico: %s en linea% d\n", s, linenumber);
}
