import 'package:dsa/data_structures/queue_array.dart';

class BinaryTreeNode<T extends Comparable> {
  T data;
  BinaryTreeNode<T>? left;
  BinaryTreeNode<T>? right;

  BinaryTreeNode(this.data, {this.left, this.right});
}

class BinaryTree<T extends Comparable> {
  BinaryTreeNode<T>? root;

  BinaryTreeNode<T> _addRecursive(BinaryTreeNode<T>? node, T value) {
    if (node == null) {
      return BinaryTreeNode(value);
    }

    if (node.data.compareTo(value) > 0) {
      node.left = _addRecursive(node.left, value);
    } else if (node.data.compareTo(value) < 0) {
      node.right = _addRecursive(node.right, value);
    }

    return node;
  }

  void add(T data) {
    root = _addRecursive(root, data);
  }

  /* 
  printBinaryTree(100) {    
    
    printBinaryTree(50) {
        printBinaryTree(25) {}     
        printBinaryTree(75) {}
    }
    printBinaryTree(200) {
      printBinaryTree(350) {}
    }
    print(100);
  }
  */

  void levelOrderTraversal() {
    final queue = QueueArray<BinaryTreeNode<T>>(100);
    queue.enqueue(root!);

    while (!queue.isEmpty) {
      final node = queue.dequeue()!;
      print(node.data);

      if (node.left != null) {
        queue.enqueue(node.left!);
      }

      if (node.right != null) {
        queue.enqueue(node.right!);
      }
    }
  }

  void printBinaryTree(BinaryTreeNode<T>? node) {
    if (node == null || (node.right == null && node.left == null)) {
      return;
    }

    print(node.left?.data);
    print(node.right?.data);

    printBinaryTree(node.left);

    printBinaryTree(node.right);
  }
}

void main(List<String> args) {
  final list = [100, 50, 25, 75, 200, 350];
  final binaryTree = BinaryTree();
  for (final item in list) {
    binaryTree.add(item);
  }

  binaryTree.levelOrderTraversal();
}
