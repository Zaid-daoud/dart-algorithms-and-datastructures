/// Doubly Linked List Implementation in Pure Dart
///
/// WHAT IS A DOUBLY LINKED LIST?
/// A linear data structure where nodes have TWO pointers: `next` and `prev`.
/// This enables bidirectional traversal (forward and backward).
///
/// KEY ADVANTAGE OVER SINGLY LINKED LIST:
/// - Tail Deletion: O(1) Time ⚡ (Singly Linked List takes O(n)).
/// - Direct Node Removal: O(1) Time ⚡ (Given a Node reference, unlinking it takes 2 pointer swaps).
/// - Bidirectional Traversal: Great for LRU Cache, Undo/Redo, Browser History, Music Players.
///
/// TIME COMPLEXITY:
/// - Prepend (Add Front)     : O(1) Time ⚡
/// - Append (Add Back)       : O(1) Time ⚡
/// - Remove Head (Front)     : O(1) Time ⚡
/// - Remove Tail (Back)      : O(1) Time ⚡
/// - Remove Node (By Pointer): O(1) Time ⚡ (Used in LRU Cache!)
/// - Search / Access By Index: O(n) Time 🐢 (Must traverse from Head/Tail to find index)
/// - Insert / Remove At Index: O(n) Time 🐢 (Finding the index takes O(n), unlinking takes O(1))
///
/// SPACE COMPLEXITY:
/// - O(n) Heap Space (requires storing an extra `prev` pointer object per node).
library;

/// Node class for Doubly Linked List holding `next` and `prev` pointers
class DoubleNode<T> {
  T data;
  DoubleNode<T>? next;
  DoubleNode<T>? prev;

  DoubleNode(this.data, [this.prev, this.next]);

  @override
  String toString() => '$data';
}

/// Doubly Linked List Implementation
class DoublyLinkedList<T> {
  DoubleNode<T>? _head;
  DoubleNode<T>? _tail;
  int _length = 0;

  // Getters
  DoubleNode<T>? get head => _head;
  DoubleNode<T>? get tail => _tail;
  int get length => _length;
  bool get isEmpty => _length == 0;

  /// 1. Prepend (Add to front) -> O(1) Time
  void prepend(T value) {
    final DoubleNode<T> newNode = DoubleNode<T>(value, null, _head);
    if (_head == null) {
      _head = newNode;
      _tail = newNode;
    } else {
      _head!.prev = newNode;
      _head = newNode;
    }
    _length++;
  }

  /// 2. Append (Add to back) -> O(1) Time
  void append(T value) {
    final DoubleNode<T> newNode = DoubleNode<T>(value, _tail, null);
    if (_tail == null) {
      _head = newNode;
      _tail = newNode;
    } else {
      _tail!.next = newNode;
      _tail = newNode;
    }
    _length++;
  }

  /// 3. Remove Head (Remove from front) -> O(1) Time
  T? removeHead() {
    if (_head == null) return null;

    final T removedData = _head!.data;
    _head = _head!.next;

    if (_head == null) {
      _tail = null;
    } else {
      _head!.prev = null;
    }

    _length--;
    return removedData;
  }

  /// 4. Remove Tail (Remove from back) -> O(1) Time ⚡ (Singly takes O(n)!)
  T? removeTail() {
    if (_tail == null) return null;

    final T removedData = _tail!.data;
    _tail = _tail!.prev;

    if (_tail == null) {
      _head = null;
    } else {
      _tail!.next = null;
    }

    _length--;
    return removedData;
  }

  /// 5. Remove Specific Node directly (Given Node Pointer) -> O(1) Time ⚡
  /// Used in LRU Cache! Unlinking a node when you already have its pointer takes 2 steps O(1).
  T? removeNode(DoubleNode<T>? node) {
    if (node == null) return null;
    if (node == _head) return removeHead();
    if (node == _tail) return removeTail();

    node.prev?.next = node.next;
    node.next?.prev = node.prev;

    final T data = node.data;
    node.prev = null;
    node.next = null;
    _length--;
    return data;
  }

  /// 6. Optimized Node Lookup -> Searches from head or tail in O(n/2) Time
  DoubleNode<T>? getNodeAt(int index) {
    if (index < 0 || index >= _length) return null;

    DoubleNode<T>? current;
    if (index < _length ~/ 2) {
      // Search forward from Head
      current = _head;
      for (int i = 0; i < index; i++) {
        current = current?.next;
      }
    } else {
      // Search backward from Tail
      current = _tail;
      for (int i = _length - 1; i > index; i--) {
        current = current?.prev;
      }
    }
    return current;
  }

  /// 7. Insert at index -> O(n) Time (Finding index takes O(n), linking takes O(1))
  bool insertAt(int index, T value) {
    if (index < 0 || index > _length) return false;
    if (index == 0) {
      prepend(value);
      return true;
    }
    if (index == _length) {
      append(value);
      return true;
    }

    final DoubleNode<T>? target = getNodeAt(index);
    if (target == null) return false;

    final DoubleNode<T> prevNode = target.prev!;
    final DoubleNode<T> newNode = DoubleNode<T>(value, prevNode, target);

    prevNode.next = newNode;
    target.prev = newNode;
    _length++;
    return true;
  }

  /// 8. Reverse in-place by swapping next and prev pointers -> O(n) Time / O(1) Space
  void reverse() {
    if (_head == null || _head!.next == null) return;

    DoubleNode<T>? current = _head;
    DoubleNode<T>? temp;

    // Swap head and tail
    _tail = _head;

    while (current != null) {
      temp = current.prev;
      current.prev = current.next;
      current.next = temp;
      current = current.prev; // Move to next node (which is now current.prev)
    }

    if (temp != null) {
      _head = temp.prev;
    }
  }

  /// Forward traversal String
  @override
  String toString() {
    if (_head == null) return 'Empty List';
    final StringBuffer sb = StringBuffer();
    DoubleNode<T>? current = _head;
    while (current != null) {
      sb.write('${current.data}');
      if (current.next != null) sb.write(' <-> ');
      current = current.next;
    }
    return sb.toString();
  }

  /// Backward traversal String
  String toReverseString() {
    if (_tail == null) return 'Empty List';
    final StringBuffer sb = StringBuffer();
    DoubleNode<T>? current = _tail;
    while (current != null) {
      sb.write('${current.data}');
      if (current.prev != null) sb.write(' <-> ');
      current = current.prev;
    }
    return sb.toString();
  }
}

void main() {
  print('=== 🏗️ DOUBLY LINKED LIST DEMO ===');
  final DoublyLinkedList<String> list = DoublyLinkedList<String>();

  print('\n1. Appending elements O(1):');
  list.append('Track_1');
  list.append('Track_2');
  list.append('Track_3');
  print('Forward : $list');
  print('Backward: ${list.toReverseString()}');

  print('\n2. Prepending element O(1):');
  list.prepend('Track_0');
  print('Forward : $list');

  print('\n3. Removing Tail O(1) (Instant tail deletion using prev pointer!):');
  final String? removedTail = list.removeTail();
  print('Removed Tail: $removedTail');
  print('Forward     : $list');

  print(
      '\n4. Removing Middle Node Directly by Pointer (LRU Cache style) O(1) Time:');
  final DoubleNode<String>? middleNode = list.getNodeAt(1); // 'Track_1'
  final String? removedMiddle = list.removeNode(middleNode);
  print('Removed Middle Node Directly: $removedMiddle');
  print('Forward     : $list');

  print('\n5. In-Place Reversing Doubly Linked List O(n) Time / O(1) Space:');
  list.reverse();
  print('Reversed Forward : $list');
  print('Head: ${list.head?.data}, Tail: ${list.tail?.data}');
}
