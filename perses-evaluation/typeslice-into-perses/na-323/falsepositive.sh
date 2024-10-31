#!/bin/bash
#compile command to be run before python script

directory="/home/sam/repos/perses-evaluation/4614"
expected="${directory}/logspotless.txt"
inputted="${directory}/build_log.txt"
test_json="${directory}/test_data.json"
cp -r "${directory}/build_skeleton/na-error" ./
mkdir -p na-error/src/main/java/com/cogvio/time/
cp *.java na-error/src/main/java/com/cogvio/time/

cd na-error
gradle spotlessapply
gradle clean build > "$inputted" 2>&1
result=$(python3 "${directory}/falsepositive.py" na-323 "$expected" "$inputted" "$test_json")
[ "$result" = "True" ] && echo "found pattern" && exit 0
echo "did not find pattern" && exit 1
