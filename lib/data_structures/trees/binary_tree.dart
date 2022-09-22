import 'dart:math';

import 'package:ansicolor/ansicolor.dart';
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

  BinaryTreeNode<T>? find(T value) {
    var current = root;

    while (current != null) {
      if (current.data == value) {
        return current;
      } else if (current.data.compareTo(value) > 0) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    return null;
  }

  void _addTreeToTree(BinaryTreeNode<T>? node, BinaryTreeNode<T> treeNode) {
    if (node == null) {
      return;
    }

    _addRecursive(treeNode, node.data);

    _addTreeToTree(node.left, treeNode);
    _addTreeToTree(node.right, treeNode);
  }

  BinaryTreeNode<T>? remove(T value) {
    var current = root;

    while (current != null) {
      if (current.data == value) {
        if (current.right != null) {
          var temp = current.right!.left;
          current.right!.left = current.left;
          if (current.right!.right == null) {
            current.right!.right = temp;
          } else {
            _addTreeToTree(temp, current.right!.right!);
          }
        } else if (current.left != null) {
          current.right = current.left;
        }
        return current;
      } else if (current.data.compareTo(value) > 0) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    return null;
  }

  /*
  --- Function Call Stack ---

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

  void drawTree(BinaryTreeNode<T>? node, int space) {
    if (node == null) {
      return;
    }

    space += 10;

    drawTree(node.right, space);

    print('\n');
    for (var i = 10; i < space; i++) {
      print(' ');
    }
    print(node.data);

    drawTree(node.left, space);
  }

  // TODO :: Diagram of the tree
  void levelOrderTraversal() {
    int level = 1;
    int binaryLevel = 0;
    final hashMap = <int, List<int?>>{};

    (hashMap[11] ?? []).add(12);

    final queue = QueueArray<BinaryTreeNode<T>>(100);
    queue.enqueue(root!);

    while (!queue.isEmpty) {
      final node = queue.dequeue()!;

      print("${++level}: ${node.data} - Level: $binaryLevel");
      hashMap[binaryLevel] ??= List.filled(pow(2, binaryLevel).toInt(), null);
      hashMap[binaryLevel]![(level - pow(2, binaryLevel).toInt()) - 1] =
          node.data as int;
      binaryLevel = log(level) ~/ log(2);

      if (node.left != null) {
        queue.enqueue(node.left!);
      }

      if (node.right != null) {
        queue.enqueue(node.right!);
      }
    }
    print(hashMap);

    final pen = AnsiPen()..cyan(bold: true);

    String treeDiagram = '';

    for (final key in hashMap.keys) {
      treeDiagram +=
          '\t' * hashMap.keys.toList()[hashMap.keys.length - 1 - key];
      treeDiagram += hashMap[key]!.join('\t');
      treeDiagram += '\n';
    }

    String diagram = """
        2
       / \\
      /   \\
     /     \\
    1       3
   / \\     / \\
  0   7   9   1
 /   / \\     / \\
2   1   0   8   8
       /
      7
""";

    // print(pen(treeDiagram));
    // print(diagram);
  }

  void printBinaryTree(BinaryTreeNode<T>? node) {
    if (node == null || (node.right == null && node.left == null)) {
      return;
    }

    final pen = AnsiPen()..yellow(bold: true);

    if (node.left != null) {
      print("${pen('${node.data}')} <- ${pen('${node.left!.data}')}");
      // print(pen('${node.left!.data}'));
    }

    if (node.right != null) {
      print("${pen('${node.data}')} -> ${pen('${node.right!.data}')}");
      // print(pen('${node.right!.data}'));
    }

    printBinaryTree(node.left);

    printBinaryTree(node.right);
  }
}

/* 
 */

void main() {
  final list = [150, 200, 100, 115, 175, 125, 25, 50, 75, 350, 110];
  final binaryTree = BinaryTree<int>();

  for (final item in list) {
    binaryTree.add(item);
  }

  binaryTree.remove(175);

  binaryTree.printBinaryTree(binaryTree.root);
}
