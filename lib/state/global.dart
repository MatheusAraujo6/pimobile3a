int _teste(int num) {
  return num + 1;
}

class GlobalState {
  GlobalState._privateConstructor();

  static final GlobalState instance = GlobalState._privateConstructor();

  int counter = 0;

  void increaseCounter() {
    counter += _teste(2);
  }
}
