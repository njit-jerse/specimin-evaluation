// Sourced from https://github.com/uber/NullAway/issues/705#issuecomment-1368082909

package com.uber;

import org.checkerframework.checker.nullness.qual.Nullable;

class Test<K, V> {
  @Nullable Foo f;

  final class Foo {}
}
