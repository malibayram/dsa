import 'linked_list.dart';

class CircularLinkedList<T> {
  Node<T>? head;
  int length = 0;

  void insert(T data) {
    final node = Node<T>(data);
    print("length: $length");

    if (head == null) {
      head = node;
      head!.previous = node;
      head!.next = node;
    } else if (length == 1) {
      node.previous = head;
      node.next = head;
      head!.previous = node;
      head!.next = node;
    } else {
      node.previous = head!.previous;
      node.next = head;

      head!.previous = node;
      node.previous!.next = node;
    }
    length++;
  }

  void delete(T data) {
    if (head == null) {
      return;
    } else if (head!.data == data) {
      if (length == 1) {
        head = null;
      } else {
        head!.next!.previous = head!.previous;
        head!.previous!.next = head!.next;
        head = head!.next;
      }
      length--;
    } else {
      Node<T> temp = head!;
      while (temp.next!.data != head!.data) {
        // for (int i = 1; i < length; i++) {
        if (temp.next!.data == data) {
          temp.next!.next!.previous = temp;
          temp.next = temp.next!.next;
          length--;
          break;
        }
        temp = temp.next!;
      }
    }
  }

  T? search(T data) {
    if (head == null) {
      return null;
    } else {
      Node temp = head!;
      while (temp.next!.data != head!.data) {
        // for (int i = 1; i < length; i++) {
        if (temp.data == data) {
          return temp.data;
        }
        temp = temp.next!;
      }
      return null;
    }
  }

  void printCircularLinkedList() {
    Node<T>? temp = head;
    String result = '${temp?.data} ';

    do {
      temp = temp?.next;
      result += '${temp?.data} ';
    } while (temp?.next?.data != head?.data);

    print(result);
  }
}
