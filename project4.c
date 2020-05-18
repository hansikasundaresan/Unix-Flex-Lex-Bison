/*
 *
 *
 * Filename:            project4.c
 * Date:                03/28/2019
 * Author:              Hansika Sundaresan
 * Email:               hms180008@utdallas.edu
 * Version:             1.0
 * Copyright:           2019, All Rights Reserved
 *
 * Description:
 *
 *      main routine with sub functions
 */

#include "y.tab.h" //has enum values
#include <stdio.h> //printf()

int yylex(void);
extern char *yytext;


int scan() //scans and prints out corresponding token based on yylex function
{
  int token;
  
  
  token = yylex();

  while(token)
    {

      switch(token)
      {
          case NAMETOKEN:
            {
                printf("yylex returned NAMETOKEN token ");
                printf("(%s)\n", yytext);
                break;
            }
          case IDENTIFIERTOKEN:
            {
                printf("yylex returned IDENTIFIERTOKEN token ");
                printf("(%s)\n", yytext);
                break;
            }
          case NAME_INITIAL_TOKEN:
            {
                printf("yylex returned NAME_INITIAL_TOKEN token ");
                printf("(%s)\n", yytext);
                break;
            }
          case ROMANTOKEN:
            {
                printf("yylex returned ROMANTOKEN token ");
                printf("(262)\n");
                break;
            }
        case SRTOKEN:
            {
                printf("yylex returned SRTOKEN token ");
                printf("(%s)\n", yytext);
                break;
            }
        case JRTOKEN:
            {
                printf("yylex returned JRTOKEN token ");
                printf("(%s)\n", yytext);
                break;
            }
        case EOLTOKEN:
            {
                printf("yylex returned EOLTOKEN token ");
                printf("(267)\n");
                break;
            }
        case INTTOKEN:
            {
                printf("yylex returned INTTOKEN token ");
                printf("(%s)\n", yytext);
                break;
            }
        case HASHTOKEN:
            {
                printf("yylex returned HASHTOKEN token ");
                printf("(265)\n");
                break;
            }
        case COMMATOKEN:
            {
              printf("yylex returned COMMATOKEN token ");
              printf("(266)\n");
              break;
            }
        case DASHTOKEN:
            {
              printf("yylex returned DASHTOKEN token ");
              printf("(268)\n");
              break;
            }
        default:
        {
      printf("unknown TOKEN\n");
      break;
        }
      }

      token = yylex();
    }

  printf("Done!\n");
  return 0;
}

int parse() //parses and prints out corresponding case
{
  switch(yyparse())
  {
    case 0:
      printf("Parse successful\n");
      break;
    case 1:
      printf("Parse failed\n");
      break;
    case 2:
      printf("Out of memory\n");
      break;
    default:
      printf("Unknown failure\n");
      break;
  }
}


int main(int argc, char* argv[])
{
  if(strcmp(argv[0],"./scanner") == 0) //if statements check to see which method to run
  {
    printf("Scan mode:\n");
    scan();
  }
  else if(strcmp(argv[0],"./parser") == 0)
  {
    printf("Parse mode:\n");
    parse();
  }
  else
  {
    printf("Error: program can only be used to scan and parse.\n");
  }

  return 0;
}



