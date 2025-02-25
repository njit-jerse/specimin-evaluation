#!/bin/sh

# dependencies: java, scc

# for each human-written test case file, this script:
# * prints the name of the bug
# * runs the included google-java-format version on each java file
# * runs scc to count the lines, and then cuts out the number of "code"
#   lines from the scc output and prints it
# the result is a table that's ready to be copied into the paper

GJF=`pwd`/google-java-format-1.25.2-all-deps.jar

function print_hc_size() {
    # $1 is the bugid
    echo "$1 \c"
    pushd $1 > /dev/null
    find . -name "*.java" -exec java -jar $GJF -i {} \;
    scc . | awk '/^Java/ {print $6}'
    popd > /dev/null
}

# three loops to get the same order as the paper table
for i in jdk-*; do
    print_hc_size $i
done

for i in na-*; do
    print_hc_size $i
done

for i in cf-*; do
    print_hc_size $i
done
