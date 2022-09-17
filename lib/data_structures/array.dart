import 'dart:developer';

class Array<T> {
  final int length;
  late List<T?> data;

  Array(this.length) {
    data = List<T?>.filled(length, null);
  }

  T? operator [](int index) => data[index];

  void operator []=(int index, T value) {
    data[index] = value;
  }

  void insert(T value) {
    for (int i = 0; i < length; i++) {
      if (data[i] == null) {
        data[i] = value;
        return;
      }
    }
    throw Exception('Array is full');
  }

  void delete(T value) {
    for (int i = 0; i < length; i++) {
      if (data[i] == value) {
        data[i] = null;
        return;
      }
    }
    throw Exception('Value not found');
  }

  T? search(T value) {
    for (int i = 0; i < length; i++) {
      if (data[i] == value) {
        return data[i];
      }
    }
    return null;
  }

  void print() {
    log(data.toString(), name: 'Array');
  }
}
