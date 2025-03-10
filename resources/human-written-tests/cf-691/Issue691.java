// from https://github.com/typetools/checker-framework/pull/725

// Test case for Issue 691:
// https://github.com/typetools/checker-framework/issues/691
// Skipping the test until issues 688 and 723 are also closed.
// @skip-test

interface MyInterface<T> {}

// This code causes greatestLowerBound in the qualifier hierarchy to be executed, which results
// in a crash if the default implementation isn't correct for a given checker. A checker could
// issue a valid type checking error for this code, so suppress any warnings.
@SuppressWarnings("")
class Issue285<T> implements MyInterface<T> {
  MyInterface<?> mi = new Issue285<>();
}
