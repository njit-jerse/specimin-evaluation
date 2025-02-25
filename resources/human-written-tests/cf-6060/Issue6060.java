// source: https://github.com/typetools/checker-framework/issues/6060#issuecomment-1611651745

import java.util.Spliterator;

public interface Issue6060<R> extends Iterable<R> {
  default Spliterator<R> spliterator() {
    return Iterable.super.spliterator();
  }
}
