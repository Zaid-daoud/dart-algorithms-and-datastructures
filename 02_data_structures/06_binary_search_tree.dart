/// Binary Search Tree (BST) & Tree Traversals Implementation in Pure Dart
///
/// WHAT IS A BINARY SEARCH TREE (BST)?
/// A node-based hierarchical data structure where for every node:
/// - All values in the LEFT subtree are SMALLER than the node's value.
/// - All values in the RIGHT subtree are GREATER THAN OR EQUAL TO the node's value.
///
/// TREE TRAVERSALS:
/// 1. In-Order (Left, Root, Right)   : Visits nodes in SORTED ASCENDING ORDER!
/// 2. Pre-Order (Root, Left, Right)  : Useful for cloning / serializing tree hierarchy.
/// 3. Post-Order (Left, Right, Root) : Useful for bottom-up deletion / calculating tree node sizes.
/// 4. Level-Order (BFS Queue)        : Visits nodes level by level from top to bottom.
///
/// TIME COMPLEXITY:
/// - Search / Insert / Delete : O(log n) Average / O(n) Worst Case (if tree becomes skewed/unbalanced)
///
/// SPACE COMPLEXITY:
/// - O(n) Heap Memory Space (stores N TreeNode objects).
library;

import 'dart:collection';

/// Node class for Binary Search Tree
class TreeNode<T extends Comparable<dynamic>> {
  T data;
  TreeNode<T>? left;
  TreeNode<T>? right;

  TreeNode(this.data, [this.left, this.right]);

  @override
  String toString() => '$data';
}

/// Binary Search Tree Implementation
class BinarySearchTree<T extends Comparable<dynamic>> {
  TreeNode<T>? root;

  bool get isEmpty => root == null;

  /// 1. Insert value -> O(log n) Average Time
  void insert(T value) {
    root = _insertRecursive(root, value);
  }

  TreeNode<T> _insertRecursive(TreeNode<T>? node, T value) {
    if (node == null) return TreeNode<T>(value);

    if (value.compareTo(node.data) < 0) {
      node.left = _insertRecursive(node.left, value);
    } else {
      node.right = _insertRecursive(node.right, value);
    }
    return node;
  }

  /// 2. Search value -> O(log n) Average Time
  bool search(T value) {
    return _searchRecursive(root, value);
  }

  bool _searchRecursive(TreeNode<T>? node, T value) {
    if (node == null) return false;
    if (node.data == value) return true;

    if (value.compareTo(node.data) < 0) {
      return _searchRecursive(node.left, value);
    } else {
      return _searchRecursive(node.right, value);
    }
  }

  /// 3. Delete value -> O(log n) Average Time
  void delete(T value) {
    root = _deleteRecursive(root, value);
  }

  TreeNode<T>? _deleteRecursive(TreeNode<T>? node, T value) {
    if (node == null) return null;

    if (value.compareTo(node.data) < 0) {
      node.left = _deleteRecursive(node.left, value);
    } else if (value.compareTo(node.data) > 0) {
      node.right = _deleteRecursive(node.right, value);
    } else {
      // Node to delete found!

      // Case 1: Leaf node (0 children)
      if (node.left == null && node.right == null) return null;

      // Case 2: 1 child
      if (node.left == null) return node.right;
      if (node.right == null) return node.left;

      // Case 3: 2 children -> Find In-Order Successor (smallest in right subtree)
      final TreeNode<T> minRight = _findMinNode(node.right!);
      node.data = minRight.data;
      node.right = _deleteRecursive(node.right, minRight.data);
    }
    return node;
  }

  TreeNode<T> _findMinNode(TreeNode<T> node) {
    TreeNode<T> current = node;
    while (current.left != null) {
      current = current.left!;
    }
    return current;
  }

  /// 4. In-Order Traversal (Left, Root, Right) -> Returns Sorted List
  List<T> inOrder() {
    final List<T> result = [];
    _inOrderRecursive(root, result);
    return result;
  }

  void _inOrderRecursive(TreeNode<T>? node, List<T> result) {
    if (node == null) return;
    _inOrderRecursive(node.left, result);
    result.add(node.data);
    _inOrderRecursive(node.right, result);
  }

  /// 5. Pre-Order Traversal (Root, Left, Right)
  List<T> preOrder() {
    final List<T> result = [];
    _preOrderRecursive(root, result);
    return result;
  }

  void _preOrderRecursive(TreeNode<T>? node, List<T> result) {
    if (node == null) return;
    result.add(node.data);
    _preOrderRecursive(node.left, result);
    _preOrderRecursive(node.right, result);
  }

  /// 6. Post-Order Traversal (Left, Right, Root)
  List<T> postOrder() {
    final List<T> result = [];
    _postOrderRecursive(root, result);
    return result;
  }

  void _postOrderRecursive(TreeNode<T>? node, List<T> result) {
    if (node == null) return;
    _postOrderRecursive(node.left, result);
    _postOrderRecursive(node.right, result);
    result.add(node.data);
  }

  /// 7. Level-Order Traversal (BFS Breadth-First Search)
  List<T> levelOrder() {
    final List<T> result = [];
    if (root == null) return result;

    final ListQueue<TreeNode<T>> queue = ListQueue<TreeNode<T>>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      final TreeNode<T> current = queue.removeFirst();
      result.add(current.data);

      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
    return result;
  }
}

void main() {
  print('=== 🏗️ BINARY SEARCH TREE DEMO ===');
  final BinarySearchTree<int> bst = BinarySearchTree<int>();

  print('\n1. Inserting values into BST [50, 30, 70, 20, 40, 60, 80]:');
  for (final val in [50, 30, 70, 20, 40, 60, 80]) {
    bst.insert(val);
  }

  print('\n2. Tree Traversals:');
  print('• In-Order Traversal (Sorted)   : ${bst.inOrder()}');
  print('• Pre-Order Traversal (Root First): ${bst.preOrder()}');
  print('• Post-Order Traversal (Leaves First): ${bst.postOrder()}');
  print('• Level-Order Traversal (BFS)   : ${bst.levelOrder()}');

  print('\n3. Searching values O(log n):');
  print('• Contains 60? : ${bst.search(60)}');
  print('• Contains 99? : ${bst.search(99)}');

  print('\n4. Deleting Node 30 (Node with 2 children):');
  bst.delete(30);
  print('• In-Order Traversal after delete: ${bst.inOrder()}');
}
