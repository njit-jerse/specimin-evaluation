standalone project for cf-4614 issue. CF 3.12 exhibits a false positive output here.

command: javacheck -g Version.java -processor nullness

where javacheck-->
 export CHECKERFRAMEWORK=${HOME}/checker-framework-3.42.0
 alias javacheck='$CHECKERFRAMEWORK/checker/bin/javac'
