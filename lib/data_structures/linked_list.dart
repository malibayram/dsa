class Node<T> {
  T data;
  Node<T>? next;
  Node<T>? previous;

  Node(this.data, {this.next, this.previous});
}

class LinkedList<T> {
  Node? head;
  int length = 0;

  void insert(T data) {
    Node node = Node(data);

    if (head != null) {
      node.next = head!;
      head!.previous = node;
    }
    head = node;
    length++;
  }

  void delete(T data) {
    if (head == null) {
      return;
    } else if (head!.data == data) {
      head = head!.next;
      length--;
    } else {
      Node temp = head!;
      while (temp.next != null) {
        if (temp.next!.data == data) {
          if (temp.next!.next != null) {
            temp.next!.next!.previous = temp;
          }

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
      Node? temp = head!;
      while (temp != null) {
        if (temp.data == data) {
          return temp.data;
        }
        temp = temp.next;
      }
      return null;
    }
  }

  void printLinkedList() {
    Node? temp = head;
    String result = '${temp?.data} ';
    while (temp != null) {
      temp = temp.next;
      result += '${temp?.data} ';
    }
    print(result);
  }
}
