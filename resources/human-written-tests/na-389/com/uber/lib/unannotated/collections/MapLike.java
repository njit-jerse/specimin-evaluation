// Sourced from https://github.com/uber/NullAway/pull/390

package com.uber.lib.unannotated.collections;

import java.util.HashMap;

// Too much work to implement java.util.Map from scratch
public class MapLike<K, V> extends HashMap<K, V> {
  public MapLike() {
    super();
  }

  public void put(Item<K, V> item) {
    put(item.key, item.value);
  }
}
