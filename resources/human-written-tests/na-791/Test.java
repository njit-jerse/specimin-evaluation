// Sourced from https://github.com/uber/NullAway/issues/791#issuecomment-1650227291

import org.checkerframework.checker.nullness.qual.Nullable;

class Test {
  interface RemovalListener<K, V> {}

  static final class AsyncEvictionListener<K, V> implements RemovalListener<K, V> {
    AsyncEvictionListener(RemovalListener<K, V> delegate) {}
  }

  static class Caffeine<K, V> {
    @Nullable RemovalListener<? super K, ? super V> evictionListener;

    @SuppressWarnings({"rawtypes", "unchecked"})
    <K1 extends K, V1 extends V> @Nullable RemovalListener<K1, V1> getEvictionListener(
        boolean async) {
      var castedListener = (RemovalListener<K1, V1>) evictionListener;
      return async && (castedListener != null)
          ? new AsyncEvictionListener(castedListener)
          : castedListener;
    }
  }
}
