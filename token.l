/**Define los patterns (Expresiones regulares para el analisis lexico) **/
digito [0-9]
letra  [A-Za-z]  
%{
extern yylineno;
#include "y.tab.h"
int linenumber;
void errorSintactico(char *s,int linenumber);
%}
%%
"pare"   {printf("termino: %s ",yytext);return STOP;}
"PARE"   return STOP;
[-+]    return *yytext; /* devuelve el caracter que representa el - o + */
{digito}{digito}*   {printf("digito: %s ",yytext);yylval=atoi(yytext);return NUM;}
({letra}|_)(({letra}|{digito}){0,31})  {printf("%s numlinea:%d ",yytext,yylineno);return ID;}
\n      {yylineno++;return NUEVALINEA;}
[ \t\n]+  return ESPACIOENBLANCO;
.     {errorSintactico(yytext,yylineno);}
%%

errorSintactico(char *s, int linenumber)
{   
    printf("error sintactico: %s en linea% d\n", s, linenumber);
}
