This document lists the bugs that this evaluation repository supports,
but which we did not include in the main table of our paper. The purpose
of this document is to explain why each of these bugs was excluded. The
excluded bugs are:
* NA-89
* NA-791B
* CF-3025

## NA-89

NA-89 is not reproducible with any released version of NullAway, even
on the original program. Building a SNAPSHOT version of NullAway just to
test NA-89 is out of scope for an evaluation script, so we exclude this
bug.

## NA-791B

NA-791B is not reproducible in the reported target file. While the same crash
occurs while running NullAway on the original codebase, we do not receive the
error because:

1. The gradle task runs successfully on the target file
2. The gradle task is crashing before it can reach the target file (more likely)

Since we cannot verify that the bug is reproducible on the target file, we
exclude this bug.

## CF-3025

This bug is an interesting case. Briefly, the bug was triggered originally
by the Checker Framework passing possibly-malformed arguments to javac's
Types.lub() function, which crashes with an NPE. Based on the comments
in the issue, the CF maintainers themselves aren't sure whether the bug
is in the CF or in javac. Furthermore, the bug is still open, so there is
no test case available to use as ground truth. Since we can't reproduce this
with javac, even though we think it's a javac bug, we're excluding it.
