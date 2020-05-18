#!/usr/bin/make -f
#
# Filename:             Makefile
# Date:                 03/28/2019
# Author:               Hansika Sundaresan
# Email:                hms180008@utdallas.edu
# Version:              1.0
# Copyright:            2020, All Rights Reserved
#
# Description:
#
#       Builds a quick Lex Example Program.  Since Lex natively generates
#       C files, we will use the C compiler instead of the C++ compilar

#
# Flags for the C++ implicit rules
CC = gcc
CCFLAGS = -Werror
CPPFLAGS =

# Flags for the Lex implicit rules
#
# Implicit Makefile rule to use Lex for C programs
#
#   n.c is made automatically from n.l by running Lex. The actual recipe is
#       $(LEX) $(LFLAGS)
LEX = /bin/flex
LFLAGS =

YACC = /bin/bison
YFLAGS = -dy

#
# PROJECTNAME is a descriptive name used for the backup target
# This should not contain spaces or special characters
PROJECTNAME = Program4MakeFile

EXEC = project4

OBJS = parse.o  scan.o project4.o

# Because we are insane, keep the intermediate files so we can look at
# them If we comment this out (or remove it), the intermediate scan.c
# file is automatically deleted.
.PRECIOUS: scan.c

all: $(EXEC)

clean:
	rm -f $(OBJS) $(EXEC) y.tab.h parse.c parser  scanner scan.c *~ \#*

$(EXEC):    $(OBJS)
	$(CC) -o $@ $(OBJS)
	ln -s $(EXEC) scanner
	ln -s $(EXEC) parser

backup:
	@make clean
	@mkdir -p ~/backups; chmod 700 ~/backups
	@$(eval CURDIRNAME := $(shell basename "`pwd`"))
	@$(eval MKBKUPNAME := ~/backups/$(PROJECTNAME)-$(shell date +'%Y.%m.%d-%H:%M:%S').tar.gz)
	@echo
	@echo Writing Backup file to: $(MKBKUPNAME)
	@echo
	@-tar zcfv $(MKBKUPNAME) ../$(CURDIRNAME) 2> /dev/null
	@chmod 600 $(MKBKUPNAME)
	@echo
	@echo Done!

