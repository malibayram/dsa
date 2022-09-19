import 'package:dsa/data_structures/queue_array.dart';
import 'package:dsa/data_structures/queue_priority_array.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dsa/data_structures/index.dart';

void main() {
  final items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  group("Data Structures Tests", () {
    test('Queue Array Test', () {
      final queue = QueueArray<int>(items.length);

      for (var item in items) {
        queue.enqueue(item);
      }

      queue.display();

      expect(queue.dequeue(), 1);
      expect(queue.dequeue(), 2);
      expect(queue.dequeue(), 3);
      expect(queue.dequeue(), 4);
      expect(queue.dequeue(), 5);
      expect(queue.dequeue(), 6);
      expect(queue.dequeue(), 7);
      expect(queue.dequeue(), 8);
      expect(queue.dequeue(), 9);
      expect(queue.dequeue(), 0);
      expect(queue.dequeue(), null);
    });

    test('Queue Priority Array Test', () {
      final queue = QueuePriorityArray<int>(items.length);

      for (var item in items) {
        queue.enqueue(QueuePriorityItem(data: item, priority: item % 3));
      }

      queue.printQueue();
      // [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
      // congratulations

      expect(queue.dequeue()?.data, 2);
      expect(queue.dequeue()?.data, 5);
      expect(queue.dequeue()?.data, 8);
      expect(queue.dequeue()?.data, 1);
      expect(queue.dequeue()?.data, 4);
      expect(queue.dequeue()?.data, 7);
      expect(queue.dequeue()?.data, 3);
      expect(queue.dequeue()?.data, 6);
      expect(queue.dequeue()?.data, 9);
      expect(queue.dequeue()?.data, 0);
      expect(queue.dequeue(), null);
    });

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
