class MaxHeap<T extends Comparable<T>> {
  List<T> _heap = [];

  MaxHeap();

  MaxHeap.fromList(List<T> list) {
    _heap = list;
    for (int i = _heap.length ~/ 2; i >= 0; i--) {
      _heapify(i);
    }
  }

  void insert(T element) {
    _heap.add(element);
    _heapifyUp(_heap.length - 1);
  }

  T extractMax() {
    if (_heap.isEmpty) {
      throw Exception('Heap is empty');
    }
    T max = _heap[0];
    _heap[0] = _heap[_heap.length - 1];
    _heap.removeLast();
    _heapify(0);
    return max;
  }

  void _heapifyUp(int index) {
    int parent = (index - 1) ~/ 2;
    if (index > 0 && _heap[index].compareTo(_heap[parent]) > 0) {
      T temp = _heap[index];
      _heap[index] = _heap[parent];
      _heap[parent] = temp;
      _heapifyUp(parent);
    }
  }

  void _heapify(int index) {
    int left = 2 * index + 1;
    int right = 2 * index + 2;
    int largest = index;
    if (left < _heap.length && _heap[left].compareTo(_heap[largest]) > 0) {
      largest = left;
    }
    if (right < _heap.length && _heap[right].compareTo(_heap[largest]) > 0) {
      largest = right;
    }
    if (largest != index) {
      T temp = _heap[index];
      _heap[index] = _heap[largest];
      _heap[largest] = temp;
      _heapify(largest);
    }
  }

  @override
  String toString() {
    return _heap.toString();
  }
}
