// Sourced from: https://github.com/uber/NullAway/pull/108

import javax.annotation.Nullable;

public class NullAwayNegativeCases {
  static class TestAnon {

    TestAnon(@Nullable Object p) {}
  }

  static TestAnon testAnon(@Nullable Object q) {
    return new TestAnon(q) {};
  }
}
