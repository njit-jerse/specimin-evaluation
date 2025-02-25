// Sourced from https://github.com/uber/NullAway/pull/390

package com.uber;

import com.uber.lib.unannotated.collections.Item;
import com.uber.lib.unannotated.collections.MapLike;
import javax.annotation.Nullable;

public class Test {
  public static MapLike test_389(@Nullable Item<String, String> item) {
    MapLike<String, String> map = new MapLike<String, String>();
    if (item != null) { // Required to trigger dataflow analysis
      map.put(item);
    }
    return map;
  }
}
