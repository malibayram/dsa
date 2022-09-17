class QueuePriorityItem<T> {
  T data;
  int priority;

  QueuePriorityItem(this.data, this.priority);
}

class QueuePriorityArray<T> {
  final _queue = <QueuePriorityItem<T>>[];
  int _front = -1;
  int _rear = -1;

  void clear() {
    _queue.clear();
    _front = -1;
    _rear = -1;
  }

  void enqueue(QueuePriorityItem<T> item) {
    if (_front == -1) {
      _front = 0;
      _rear = 0;
      _queue.add(item);
    } else {
      int i = _rear;
      while (i >= _front && _queue[i].priority > item.priority) {
        _queue[i + 1] = _queue[i];
        i--;
      }
      _queue[i + 1] = item;
      _rear++;
    }
  }

  QueuePriorityItem<T>? dequeue() {
    if (_front == -1) {
      return null;
    }
    QueuePriorityItem<T> item = _queue[_front];
    _queue.removeAt(_front);
    _rear--;
    if (_rear == -1) {
      _front = -1;
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

  void printQueue() {
    String result = '';
    for (int i = _front; i <= _rear; i++) {
      result += '${_queue[i].data} ';
    }
    print(result);
  }
}
