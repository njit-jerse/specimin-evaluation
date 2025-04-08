This script executes Specimin on various bugs reported in checker frameworks and java JDK and records the execution status.
These scripts were used to produce Table 1 in the paper "Static Program Reduction via Type-Directed Slicing", published
at ISSTA 2025.

# Execution command

python main.py

# Index of repository contents
* various `*.py` scripts: these are the scripts to actually run the experiments in
Table 1 of the paper. The entry point is `main.py`.
* `exclusions.md`: this file lists three bugs that we excluded from Table 1 despite
our scripts supporting them, because of various issues in reproducing the original
problem in the analysis without Specimin. The justifications are explained individually
in this file.
* `check_compilation.sh/.bat`: helper scripts to check that the outputs for each target compile
* `resources/test_data.json`: this json file lists all of the targets and various information
about them, including the regular expressions used to check if stack traces match, links
to the original bug reports, etc. This is the main data file.
* `perses-evaluation`: this is the reproduction package for the experiments in section 6.5.
See its `README.md` for details.

