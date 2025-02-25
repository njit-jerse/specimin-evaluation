#!/bin/sh

# This script should run after main.py. It takes the output from Specimin
# and formats it using the copy of google-java-format stored with the
# human-written tests, for comparison. Like the print-table.sh script
# in the human-written test directory, it prints out the results nicely
# formatted so that they're easy to copy into the paper.

# dependencies: java, scc

GJF=`pwd`/resources/human-written-tests/google-java-format-1.25.2-all-deps.jar

function print_hc_size() {
    # $1 is the bugid
    echo "$1 \c"
    pushd $1/output > /dev/null || return
    find . -name "*.java" -exec java -jar $GJF -i {} \;
    scc . | awk '/^Java/ {print $6}'
    popd > /dev/null
}

# three loops to get the same order as the paper table
pushd ISSUES

for i in jdk-*; do
    print_hc_size $i
done

for i in na-*; do
    print_hc_size $i
done

for i in cf-*; do
    print_hc_size $i
done

print_hc_size Issue689

