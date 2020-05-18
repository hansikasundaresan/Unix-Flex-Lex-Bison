/*
*
*
* Filename:            parse.y
* Date:                03/27/2020
* Author:              Hansika Sundaresan
* Email:               hms180008@utdallas.edu
* Version:             1.0
* Copyright:           2020, All Rights Reserved
*
* Description:
*  file is Bison, used for parsing of tokens, prints to stderr
*
*/

%{
  #include <stdlib.h>
  #include <stdio.h>
  #include <string.h>
   #include "header.h"
  int yylex(void);
  char* yytext;
%}

%token		NAMETOKEN
%token  	IDENTIFIERTOKEN
%token		NAME_INITIAL_TOKEN
%token		ROMANTOKEN
%token		SRTOKEN
%token		JRTOKEN
%token		EOLTOKEN
%token		INTTOKEN
%token		COMMATOKEN
%token		DASHTOKEN
%token		HASHTOKEN

%start postal_address

%%

postal_address:
	address_block EOLTOKEN postal_address
|	address_block
;

address_block:
	name_part street_address location_part 
;

name_part:
	personal_part last_name suffix_part EOLTOKEN
|	personal_part last_name EOLTOKEN
|	error EOLTOKEN						    {printf("Bad name_part ... skipping to newline\n");}
;

street_address:
	street_number street_name INTTOKEN EOLTOKEN		    {fprintf(stderr, "<AptNum>%d</AptNum>\n",$3);}
|	street_number street_name HASHTOKEN INTTOKEN EOLTOKEN	    {fprintf(stderr, "<AptNum>%d</AptNum>\n",$4);}
|	street_number street_name EOLTOKEN
|	error EOLTOKEN						    {printf("Bad address_line ... skipping to newline\n");}
;

location_part:
	town_name COMMATOKEN state_code zip_code EOLTOKEN
|	error EOLTOKEN						    {printf("Bad location_part ... skipping to newline\n");}
	{fprintf(stderr, "\n");}
;

personal_part:
	NAMETOKEN						    {fprintf(stderr, "<FirstName>%s</FirstName>\n", yytext);}
|	NAME_INITIAL_TOKEN				    {fprintf(stderr, "<FirstName>%s</FirstName>\n", yytext);}
;

last_name:
	NAMETOKEN						    {fprintf(stderr, "<LastName>%s</LastName>\n", yytext);}
;

suffix_part:
	SRTOKEN							    {fprintf(stderr, "<Suffix>%s</Suffix>\n", yytext);}
|	JRTOKEN							    {fprintf(stderr, "<Suffix>%s</Suffix>\n", yytext);}
|	ROMANTOKEN						    {fprintf(stderr, "<Suffix>%s</Suffix>\n", yytext);}
;

street_number:
	INTTOKEN						           {fprintf(stderr, "<HouseNumber>%s</HouseNumber>\n", yytext);}
|	IDENTIFIERTOKEN						       {fprintf(stderr, "<HouseNumber>%s</HouseNumber>\n", yytext);}
;

street_name:
	NAMETOKEN						           {fprintf(stderr, "<StreetName>%s</StreetName>\n", yytext);}
;

town_name:
	NAMETOKEN						           {fprintf(stderr, "<City>%s</City>\n", yytext);}
;

state_code:
	NAMETOKEN						           {fprintf(stderr, "<State>%s</State>\n", yytext);}
;

zip_code:
	INTTOKEN DASHTOKEN INTTOKEN				 {fprintf(stderr, "<Zip5>%d</Zip5>\n",$1);
	 fprintf(stderr, "<Zip4>%d</Zip4>\n",$3); fprintf(stderr, "\n");}
|	INTTOKEN						        {fprintf(stderr, "<Zip5>%d</Zip5>\n",$1); fprintf(stderr, "\n");}
;
	
%%

extern void yyerror(char *s)
{
}
