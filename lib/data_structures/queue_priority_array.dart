class QueuePriorityItem<T> {
  final T data;
  final int priority;

  QueuePriorityItem({required this.data, required this.priority});

  @override
  String toString() {
    return 'QueuePriorityItem(data: $data, priority: $priority)';
  }
}

class QueuePriorityArray<T> {
  QueuePriorityArray(final int capacity) {
    _queue = List<QueuePriorityItem<T>?>.filled(capacity, null);
  }

  late final List<QueuePriorityItem<T>?> _queue;

  int _front = -1;
  int _rear = -1;
  int _size = 0;

  void clear() {
    _queue.clear();
    _front = -1;
    _rear = -1;
    _size = 0;
  }

  void enqueue(QueuePriorityItem<T> item) {
    if (isFull()) {
      print('Queue is full');
      return;
    }
    if (_front == -1) {
      _front = 0;
      _rear = 0;
      _queue[_rear] = item;
    } else {
      // Büyük olan daha önemli ve öne gelecek
      // [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
      // [2, 1, 4, 3, null, null, null, null, null, null];
      int i = _rear; // 2
      while (_queue[i] != null && _queue[i]!.priority < item.priority) {
        _queue[(i + 1) % _queue.length] = _queue[i];
        if (i == 0) {
          i = _queue.length;
        }
        i--; // 1
      }
      _queue[(i + 1) % _queue.length] = item;
      _rear++;
    }

    _size++;
  }

  QueuePriorityItem<T>? dequeue() {
    if (isEmpty()) {
      print('Queue is empty');
      return null;
    }
    final item = _queue[_front]!;

    _queue[_front] = null;
    _rear--;

    if (_rear == -1) {
      _front = -1;
    } else {
      _front = (_front + 1) % _queue.length;
    }

    return item;
  }

  QueuePriorityItem<T>? peek() {
    if (_front == -1) {
      return null;
    }
    return _queue[_front];
  }

  bool isEmpty() {
    return _front == -1;
  }

  bool isFull() {
    return _size == _queue.length;
  }

  void printQueue() {
    String result = '';
    if (isEmpty()) {
      print('Queue is empty');
      return;
    } // [4, 4, 5, 8, null, null, 5, 5, 5, 7]
    if (_front > _rear) {
      for (int i = _front; i < _queue.length; i++) {
        result += "${_queue[i]!.toString()}->";
      }
      for (int i = 0; i <= _rear; i++) {
        result += "${_queue[i]!.toString()}->";
      }
    } else {
      for (int i = _front; i <= _rear; i++) {
        result += "${_queue[i]!.toString()}->";
      }
    }
    print(result);
  }
}
