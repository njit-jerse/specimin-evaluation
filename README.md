This script executes TypeSlice on various bugs reported in the Checker Framework,
NullAway, and Javac and records the execution status. This anonymized version of
the evaluation scripts is not expected to actually run, because it depends on
the existence of forked versions of each target repository (which we have not
anonymized, since that would unreasonably time-consuming: there are 28+ of them!).
We provide the scripts in anonymized form here so that the reviewers can see how
we produced the numbers in the paper, but actually running these scripts must wait
until the (unblinded) artifact evaluation.

# Index of repository contents
* various `*.py` scripts: these are the scripts to actually run the experiments in
Table 1 of the paper. The entry point is `main.py`.
* `exclusions.md`: this file lists three bugs that we excluded from Table 1 despite
the scripts supporting them, because of various issues in reproducing the original
problem in the analysis without TypeSlice. The justifications are explained individually
in this file.
* `check_compilation.sh/.bat`: helper scripts to check that the outputs for each target compile
* `resources/test_data.json`: this json file lists all of the targets and various information
about them, including the regular expressions used to check if stack traces match, links
to the original bug reports, etc. This is the main data file.
* `perses-evaluation`: this is the reproduction package for the experiments in section VI-E.
See its `README.md` for details.
