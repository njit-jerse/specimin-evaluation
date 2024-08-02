#!/bin/bash

#directory=$(pwd)
#sed -i "4s|.*|directory=${directory}|" 'input/cf-parser-error/src/main/java/net/mtu/eggplant/checker/parser_error/falsepositive.sh'
directory=$(pwd)
tempfile=$(mktemp)
sed "4s|.*|directory=\"${directory}\"|" 'input/cf-parser-error/src/main/java/net/mtu/eggplant/checker/parser_error/falsepositive.sh' > "$tempfile" && mv "$tempfile" 'input/cf-parser-error/src/main/java/net/mtu/eggplant/checker/parser_error/falsepositive.sh'
chmod +x input/cf-parser-error/src/main/java/net/mtu/eggplant/checker/parser_error/falsepositive.sh
rm -rf "${directory}/output"
cp -r input output

[ -e perses_deploy.jar ] || wget 'https://github.com/uw-pluverse/perses/releases/download/v1.8/perses_deploy.jar'
java -jar perses_deploy.jar --input-file input/cf-parser-error/src/main/java/net/mtu/eggplant/checker/parser_error/Version.java --test-script input/cf-parser-error/src/main/java/net/mtu/eggplant/checker/parser_error/falsepositive.sh --output-dir output/cf-parser-error/src/main/java/net/mtu/eggplant/checker/parser_error/
