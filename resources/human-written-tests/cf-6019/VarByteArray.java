// source: https://github.com/typetools/checker-framework/issues/6019#issuecomment-1582830442

public class VarByteArray {
  void test() {
    var magic = new byte[2];
  }
}
