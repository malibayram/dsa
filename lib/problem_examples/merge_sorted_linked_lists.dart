import 'package:dsa/data_structures/index.dart';

void main() {
  final list1 = [4, 8, 15, 19];
  final list2 = [7, 9, 10, 16];

  final linkedList1 = LinkedList<int>();
  for (final item in list1.reversed) {
    linkedList1.insert(item);
  }

  linkedList1.printLinkedList();

  final linkedList2 = LinkedList<int>();
  for (final item in list2.reversed) {
    linkedList2.insert(item);
  }

  linkedList2.printLinkedList();

  final mergedList = mergeSortedLinkedLists(linkedList1, linkedList2);
  mergedList.printLinkedList();
  print([19, 16, 15, 10, 9, 8, 7, 4, null]);
}

LinkedList mergeSortedLinkedLists(LinkedList first, LinkedList second) {
  final mergedList = LinkedList<int>();

  var firstNode = first.head;
  var secondNode = second.head;
/* 
  final list1 = [19, 24, 25, 29];
  final list2 = [7, 9, 10, 16];
*/
  while (firstNode != null) {
    while (secondNode?.data != null && secondNode!.data < firstNode.data) {
      mergedList.insert(secondNode.data);
      secondNode = secondNode.next;
    }
    mergedList.insert(firstNode.data);
    firstNode = firstNode.next;
  }

  return mergedList;
}
