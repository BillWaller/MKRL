#!/bin/bash
# mkrl.sh
# Bill Waller
# billxwaller@gmail.com
# create record layout from COBOL File Descriptor or Data Structure
# usage: mkrl.sh DS_file_spec [-nr]
# DS_file_spec identifies a COBOL File Descriptor or Data Structure
# Record Layout will be placed in `basename Fd_file_spec`".RL"

if [ $# = 0 ]; then
    echo "usage: DS_file_spec [-nr]"
    exit 1
fi
if [ ! -f $1 ]; then
    echo $1 "file not found"
    exit 1
fi
file=$1
# -nr - don't remove temporary files
noremove=0
if [ "$2" = "-nr" ]; then
    noremove=1
fi
rl_file=`basename $file | sed 's/\..*$//'`.RL
grep -i "varying in size" $file >/dev/null 2>&1
rc=$?
# grep returns 0 if string is found
if [ $rc != 0 ]; then
    grep -i "occurs\s*[0-9]*\s*to" $file >/dev/null 2>&1
    rc=$?
fi
if [ $rc = 0 ]; then
    {  echo ERROR: variable length files not implemented
       echo $file is variable length
    } | tee $rl_file
    exit $rc
fi 
grep -i "redefines" $file >/dev/null 2>&1
rc=$?
if [ $rc = 0 ]; then
    {  echo ERROR: redefines not implemented
       echo $file contains redefines clause
    } | tee $rl_file
    exit $rc
fi 
grep -i -v '^       fd' $file >TMP.DS
if [ ! -x DS-PP ]; then
    make DS-PP
fi
./DS-PP
if [ DS-PARSER.CBL -nt DS-PARSER ]; then
    make DS-PARSER
fi
./DS-PARSER
rm -f RL
make RL
./RL
mv DS.RL $rl_file
echo record layout $rl_file
if [ $noremove = 0 ]; then
    rm TMP.DS DS.DS
fi
exit 0
