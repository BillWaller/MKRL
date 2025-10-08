# Derive Record Layouts from File Descriptors
# DS-ANALYZER is created by DS-PARSER
# use mkrl.sh to run DS-PARSER
#
# Note: RL requires DS-ANALYZER.CBL, which is created by DS-PARSER
# run mkrl.sh SOME.DS to create
#
# This Makefile is used by mkrl.sh to build RL
#
# mkrl.sh FILE.DS 
# FILE-DS -> DS-PARSER -> DS-ANALYZER.CBL
# DS-ANALYZER -> RL.CBL -> FILE.RL
# Record Layout in FILE.RL

CCFLAGS= -g -O0
COBCFLAGS= -g -O0 -debug -std=rm -Wall -fsource-location -ftraceall
LDFLAGS=`cob-config --libs`
COBCLEAN=$*.s $*.i $*.c.h $*.c.l $*.so $*.deps $*.dep
OBJS= DS-PARSER DS-PP

all: $(OBJS)
	@echo make complete

clean:
	rm -fv *.DS *.RL DS-PP DS-PARSER DS-ANALYZER* RL

DS-PP:	DS-PP.CBL
	cobcd $(COBCFLAGS) -x DS-PP.CBL

DS-PARSER:	DS-PARSER.CBL
	cobcd $(COBCFLAGS) -x DS-PARSER.CBL

RL:	RL.CBL DS-ANALYZER.CBL
	cobcd $(COBCFLAGS) -x RL.CBL
