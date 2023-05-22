class GlobalState {
  GlobalState._privateConstructor();

  static final GlobalState instance = GlobalState._privateConstructor();

  int counter = 0;

  void increaseCounter() {
    counter += 1;
  }
}
