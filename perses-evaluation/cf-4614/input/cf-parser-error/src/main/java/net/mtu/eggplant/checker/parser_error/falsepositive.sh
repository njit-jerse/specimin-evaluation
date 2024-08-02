#!/bin/bash
#compile command to be run before python script

directory="/home/sam/repos/perses-evaluation/cf-4614"
expected="${directory}/expected_log.txt"
inputted="${directory}/build_log.txt"
test_json="${directory}/test_data.json"
cp -r "${directory}/build_skeleton/cf-parser-error" ./
mkdir -p cf-parser-error/src/main/java/net/mtu/eggplant/checker/parser_error/
cp *.java cf-parser-error/src/main/java/net/mtu/eggplant/checker/parser_error/

cd cf-parser-error
gradle spotlessapply
gradle clean build > "$inputted" 2>&1
result=$(python3 "${directory}/falsepositive.py" cf-4614 "$expected" "$inputted" "$test_json")
[ "$result" = "True" ] && echo "found pattern" && exit 0
echo "did not find pattern" && exit 1
