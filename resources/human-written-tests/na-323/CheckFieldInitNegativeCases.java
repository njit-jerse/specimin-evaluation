// Sourced from: https://github.com/uber/NullAway/pull/325

import com.facebook.infer.annotation.Initializer;

public class CheckFieldInitNegativeCases {
  final class T8 {

    Object f;

    @Initializer
    public void init1() {
      init();
    }

    public void init() {
      f = new Object();
    }
  }

  final class T9 {

    Object f;

    public T9() {
      init();
    }

    public void init() {
      f = new Object();
    }
  }
}
