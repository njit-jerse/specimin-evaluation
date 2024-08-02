## Hey hey people
to get this to run, just run this script
```runthis.sh```
The first script defines a variable for the directory it's in, then calls
perses. Perses demands that the sh file be in the same directory as the java
source file, ```falsepositive.sh``` compiles the output from the given
gradle.build. These files are copied to the 'final' folder to make a build
location. This is neccecary with the usage of a gradle build system because
there is a specific file structure demand.
