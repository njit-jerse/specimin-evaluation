// Source: https://github.com/typetools/checker-framework/issues/3020#issue-543932965

enum SomeEnum {
  INSTANCE;

  void retrieveConstant() {
    Class<?> theClass = SomeEnum.class;
    Object unused = passThrough(theClass.getEnumConstants())[0];
  }

  <T> T passThrough(T t) {
    return t;
  }
}
