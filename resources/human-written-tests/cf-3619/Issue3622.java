// Confusing, the initial report in #3619 was split into two:
// * 3619 was used to track a poor error message
// * 3622 (the source of this test case) was created to track the false positive

// Test case for https://tinyurl.com/cfissue/3622

// @skip-test until the issue is fixed

import java.util.List;
import org.checkerframework.checker.nullness.qual.Nullable;

public class Issue3622 {

  public class ImmutableIntList1 {

    @Override
    public boolean equals(@Nullable Object obj) {
      return obj instanceof ImmutableIntList1 ? true : obj instanceof List;
    }
  }

  public class ImmutableIntList2 {

    @Override
    public boolean equals(@Nullable Object obj) {
      if (obj instanceof ImmutableIntList2) {
        return true;
      } else {
        return obj instanceof List;
      }
    }
  }
}
