// source: https://github.com/typetools/checker-framework/issues/3021

import org.checkerframework.checker.nullness.qual.Nullable;

class Caller {
  <T> void make() {
    new Lib<@Nullable T>() {};
  }
}

class Lib<T> {}
