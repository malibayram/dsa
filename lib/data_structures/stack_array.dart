class StackArray<T> {
  final _stack = <T>[];
  int _top = -1;

  void clear() {
    _stack.clear();
    _top = -1;
  }

  void push(T value) {
    _stack.add(value);
    _top++;
  }

  T? pop() {
    if (_top == -1) {
      return null;
    }
    T value = _stack[_top];
    _stack.removeAt(_top);
    _top--;
    return value;
  }

  T? peek() {
    if (_top == -1) {
      return null;
    }
    return _stack[_top];
  }

  bool isEmpty() {
    return _top == -1;
  }

  void printStack() {
    String result = '';
    for (int i = _top; i >= 0; i--) {
      result += '${_stack[i]} ';
    }
    print(result);
  }
}
