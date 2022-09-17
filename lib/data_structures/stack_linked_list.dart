// Veri Yapıları -> Data Structures
// Algoritmalar -> Algorithms

import 'package:dsa/data_structures/linked_list.dart';

class StackLinkedList<T> {
  final stack = LinkedList();

  void push(T data) {
    stack.insert(data);
  }

  T? pop() {
    if (stack.head != null) {
      stack.delete(stack.head!.data);
    }
    return stack.head?.data;
  }

  T? peek() {
    return stack.head?.data;
  }

  bool isEmpty() {
    return stack.length == 0;
  }

  int size() {
    return stack.length;
  }

  void printStack() {
    stack.printLinkedList();
  }
}
