/*
 *
 *
 * Filename:            scan.l
 * Date:                03/28/2019
 * Author:              Hansika Sundaresan
 * Email:               hms180008@utdallas.edu
 * Version:             1.0
 * Copyright:           2020, All Rights Reserved
 *
 * Description:
 *
 *      lex file to scan for tokens
 */

%option noyywrap
%option nounput
%option noinput

%{
  #include "y.tab.h"
%}

%%


[ \t\r]+                        { /* eat up whitespace */ }
[A-Z](\.)?                      { return NAME_INITIAL_TOKEN; }
I{1,4}(V)?                      { return ROMANTOKEN; }
[A-Za-z][a-zA-Z]+               { return NAMETOKEN; }
"Jr."                           { return JRTOKEN; }
"Sr."                           { return SRTOKEN; }
[\n]                            { return EOLTOKEN; }
[0-9]+                          { yylval = atoi(yytext); return INTTOKEN; }
"#"                             { return HASHTOKEN; }
[\,]                            { return COMMATOKEN; }
"-"                             { return DASHTOKEN; }
[A-Za-z0-9]+			        { return IDENTIFIERTOKEN; }

%%

/*
 * This section is empty on purpose.
 *    DO NOT PUT YOUR main() routine here.
 *
 * Put your main routine in a separate file.
*/
