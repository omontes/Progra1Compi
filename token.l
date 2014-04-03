/**Define los patterns (Expresiones regulares para el analisis lexico) **/
digito [0-9]
letra  [A-Za-z]  
%{
#include "y.tab.h"
%}
%%
"pare"   return STOP;
"PARE"   return STOP;
{digito}{digito}*   {printf("%s ",yytext);return NUM;}
({letra}|_)(({letra}|{digito}){0,31})  {printf("%s ",yytext);return ID;}
\n      return NUEVALINEA;
[ \t\n]+  return ESPACIOENBLANCO;
.     return OTRO;
%%
