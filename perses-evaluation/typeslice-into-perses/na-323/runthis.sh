#!/bin/bash

#directory=$(pwd)
#sed -i "4s|.*|directory=${directory}|" 'input/src/main/java/net/mtu/eggplant/checker/parser_error/falsepositive.sh'
directory=$(pwd)
tempfile=$(mktemp)
sed "4s|.*|directory=\"${directory}\"|" 'input/src/main/java/com/cogvio/time/falsepositive.sh' > "$tempfile" && mv "$tempfile" 'input/src/main/java/com/cogvio/time/falsepositive.sh'
chmod +x input/src/main/java/com/cogvio/time/falsepositive.sh
rm -rf "${directory}/output"
cp -r input output

[ -e perses_deploy.jar ] || wget 'https://github.com/uw-pluverse/perses/releases/download/v1.8/perses_deploy.jar'
java -jar perses_deploy.jar --input-file input/src/main/java/com/cogvio/time/MutableClock.java --test-script input/src/main/java/com/cogvio/time/falsepositive.sh --output-dir output/src/main/java/com/cogvio/time/
