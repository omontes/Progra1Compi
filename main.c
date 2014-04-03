/* 
 * File:   main.c
 * Author: oscar
 *
 * Created on April 2, 2014, 6:46 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
extern int yyparse();
extern int yylex();
extern FILE *yyin;
main()
{
    /*
    printf("Escriba algo seguido de enter. Digite 'pare' or 'PARE' para terminar.\n");
    printf("\n");*/
    // Start the parser
/* Aqui se compilan el analizador lexico(lex) y el analizador sintactico y se 
   unen para crear un ejecutable bas.exe */
/* yyparse() corre el compilador */
    
    /*yyleng();
    yylex();
    return 0;*/
    
    yyin = fopen("prueba","r");
   
    do{
        
        yyparse();
    }  while(!feof(yyin));
    fclose(yyin);
}

yywrap()
{   
    return(1);
}

