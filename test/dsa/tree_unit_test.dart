import 'package:dsa/data_structures/trees/binary_tree.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Binary Tree Tests', () {
    final list = [100, 50, 25, 75, 200, 350];
    final binaryTree = BinaryTree<int>();

    for (final item in list) {
      binaryTree.add(item);
    }

    test('Binary Tree Add', () {
      expect(binaryTree.root!.data, 100);
      expect(binaryTree.root!.left!.data, 50);
      expect(binaryTree.root!.left!.left!.data, 25);
      expect(binaryTree.root!.left!.right!.data, 75);
      expect(binaryTree.root!.right!.data, 200);
      expect(binaryTree.root!.right!.right!.data, 350);
    });

    test('Binary Tree Find', () {
      expect(binaryTree.find(100)?.data, 100);
      expect(binaryTree.find(75)?.data, 75);
      expect(binaryTree.find(175)?.data, isNull);
      expect(binaryTree.find(350)?.data, 350);
    });

    binaryTree.levelOrderTraversal();
    binaryTree.drawTree(binaryTree.root, 1);
    binaryTree.printBinaryTree(binaryTree.root);
  });
}
