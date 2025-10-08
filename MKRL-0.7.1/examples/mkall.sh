#!/bin/bash
# mkall.sh
# Bill Waller billxwaller@gmail.com
# batch create record layouts from COBOL data structures
# Note that DTOH.CBL and DTOD.CBL are not file descriptors,
# but data structures that define order header records and
# order detail records respectively.
#
# DTOM.FD is the order file record
# DTOH.CBL is the order header
# DTOD.CBL is the order detail
#
# To use this script: 
# 1. Set dir to a path relative to the MKRL top level directory
# 2. Insert file names containing the data structures from which you want
#    record layouts, or
# 3. remove the references to "$dir/" and replace the echo statement
#    in the for loop with a statement that will give qualified file names,
#    such as:
#
#    ls "../CPY/*.FD" (from the MKRL top level directory)
#
IFS="
"
cd ..
dir="../CPY"
for file in `echo "CARLOCK.FD
BD.FD
DARCM.FD
DARSP.FD
DINC.FD
DTOM.FD
DTOD.CBL
DTOH.CBL
SALES.FD
SYSDATES.FD
TINMAST.FD"`
do
    echo $dir/$file
    rl_file=`basename $file | sed 's/\..*$//'`.RL
    cp $dir/$file examples
    ./mkrl.sh $dir/$file -nr
    rc=$?
    mv $rl_file examples
    if [ $rc = 0 ]; then
        dsa_file=`basename $file | sed 's/\..*$//'`-DS-ANALYZER.CBL
        mv DS-ANALYZER.CBL examples/$dsa_file
    fi
done
