// source: https://github.com/typetools/checker-framework/issues/3022

abstract class Super<K> {
  class Wrapper {
    Wrapper(K key) {}
  }
}

class Sub<K> extends Super<K> {
  void wrap(K key) {
    new Wrapper(key);
  }
}
