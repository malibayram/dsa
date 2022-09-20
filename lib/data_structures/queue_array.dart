class QueueArray<T> {
  QueueArray(final int capacity) {
    _queue = List<T?>.filled(capacity, null);
  }

  late final List<T?> _queue;

  int _front = -1;
  int _rear = -1;
  int _size = 0;

  bool get isEmpty {
    return _size == 0;
  }

  bool get isFull {
    return _size == _queue.length;
  }

  int get size {
    return _size;
  }

  T? front() {
    if (isEmpty) {
      return null;
    }
    return _queue[_front];
  }

  T? rear() {
    if (isEmpty) {
      return null;
    }
    return _queue[_rear];
  }

  void enqueue(T value) {
    if (isFull) {
      print('Queue is full');
      return;
    }
    if (_front == -1) {
      _front = 0;
    }
    _rear = (_rear + 1) % _queue.length;
    _queue[_rear] = value;
    _size++;
  }

  T? dequeue() {
    if (isEmpty) {
      print('Queue is empty');
      return null;
    } // [4, 4, 5, 8, null, null, 5, 5, 5, 7]
    T? value = _queue[_front];
    _queue[_front] = null;
    _front = (_front + 1) % _queue.length;
    _size--;
    return value;
  }

  void display() {
    String result = '';
    if (isEmpty) {
      print('Queue is empty');
      return;
    } // [4, 4, 5, 8, null, null, 5, 5, 5, 7]
    if (_front > _rear) {
      for (int i = _front; i < _queue.length; i++) {
        result += "${_queue[i]}->";
      }
      for (int i = 0; i <= _rear; i++) {
        result += "${_queue[i]!}->";
      }
    } else {
      for (int i = _front; i <= _rear; i++) {
        result += "${_queue[i]!}->";
      }
    }
    print(result);
    result = '';
    for (final item in _queue) {
      result += "${item?.toString()}->";
    }
    print(result);
  }
}
