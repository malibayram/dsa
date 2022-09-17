import 'package:flutter_test/flutter_test.dart';

import 'package:dsa/data_structures/index.dart';

void main() {
  final items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  group("Data Structures Tests", () {
    test('Array class tests', () {
      final array = Array<int>(10);
      for (final item in items) {
        array.insert(item);
      }

      try {
        array.insert(11);
      } catch (e) {
        print(e);
      }

      expect(array.data, items);

      expect(array.search(3), 3);
      expect(array.search(13), null);

      for (final item in items) {
        array.delete(item);
      }
      expect(
        array.data,
        [null, null, null, null, null, null, null, null, null, null],
      );
    });

    test('Circular Linked List Tests', () {
      final circularLinkedList = CircularLinkedList<int>();

      for (final item in items) {
        circularLinkedList.insert(item);
      }

      circularLinkedList.printCircularLinkedList();

      expect(circularLinkedList.search(2), 2);
      circularLinkedList.delete(2);
      expect(circularLinkedList.search(2), null);
    });

    test('Linked List Tests', () {
      final linkedList = LinkedList<int>();

      for (final item in items) {
        linkedList.insert(item);
      }

      linkedList.printLinkedList();

      expect(linkedList.search(2), 2);
      linkedList.delete(2);
      expect(linkedList.search(2), null);
    });

    test('StackArray Tests', () {
      final stackArray = StackArray<int>();

      for (final item in items) {
        stackArray.push(item);
      }

      stackArray.printStack();

      expect(stackArray.peek(), items.last);
      expect(stackArray.pop(), items.last);
      for (final _ in items) {
        print(stackArray.pop());
      }
      expect(stackArray.isEmpty(), isTrue);
    });

    test('StackLinkedList Tests', () {
      final stackLinkedList = StackLinkedList<int>();

      for (final item in items) {
        stackLinkedList.push(item);
      }

      stackLinkedList.printStack();

      expect(stackLinkedList.peek(), items.last);

      for (final _ in items) {
        print(stackLinkedList.pop());
      }

      expect(stackLinkedList.isEmpty(), isTrue);
    });
  });
}
