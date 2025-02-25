// From https://github.com/uber/NullAway/pull/107

import javax.annotation.Nullable;

public class NullAwayNegativeTestCases {

  static class Inner {
    @Nullable Object f1 = null;
  }

  public void assignmentExpression2(@Nullable String[] a0) {
    String[] a1;
    Inner inner = new Inner();
    if (((a1 = a0) != null) && (a1.length > 0)) {}

    if ((null != (a1 = a0)) && (a1.length > 0)) {}

    if (((inner.f1 = a0) != null) && (((String[]) inner.f1).length > 0)) {}
  }
}
