/// Singly Linked List Implementation in Pure Dart
///
/// WHAT IS A LINKED LIST?
/// A linear data structure where elements (Nodes) are connected via pointers (next).
/// Unlike Lists (Arrays), memory is NOT contiguous in RAM Heap.
///
/// TIME COMPLEXITY:
/// - Prepend (Add Front) : O(1) Time ⚡ (vs List.insert(0) which is O(n))
/// - Append (Add Back)   : O(1) Time ⚡ (using tail pointer)
/// - Delete Front        : O(1) Time ⚡
/// - Search / Access     : O(n) Time 🐢 (no direct index memory lookup)
/// - Insert / Delete At  : O(n) Time 🐢
///
/// SPACE COMPLEXITY:
/// - O(n) Auxiliary Heap Space (each node holds data + next pointer object).
library;

/// Node class representing each element in the Singly Linked List
class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data, [this.next]);

  @override
  String toString() => '$data';
}

/// Singly Linked List Implementation
class SinglyLinkedList<T> {
  Node<T>? _head;
  Node<T>? _tail;
  int _length = 0;

  // Getters
  Node<T>? get head => _head;
  Node<T>? get tail => _tail;
  int get length => _length;
  bool get isEmpty => _length == 0;

  /// 1. Prepend (Add to front) -> O(1) Time / O(1) Extra Space
  void prepend(T value) {
    final Node<T> newNode = Node<T>(value, _head);
    _head = newNode;
    _tail ??= newNode;
    _length++;
  }

  /// 2. Append (Add to back) -> O(1) Time / O(1) Extra Space (using tail)
  void append(T value) {
    final Node<T> newNode = Node<T>(value);
    if (_head == null) {
      _head = newNode;
      _tail = newNode;
    } else {
      _tail!.next = newNode;
      _tail = newNode;
    }
    _length++;
  }

  /// 3. Insert at index -> O(n) Time
  bool insert(int index, T value) {
    if (index < 0 || index > _length) return false;
    if (index == 0) {
      prepend(value);
      return true;
    }
    if (index == _length) {
      append(value);
      return true;
    }

    final Node<T>? prev = _getNodeAt(index - 1);
    if (prev == null) return false;

    final Node<T> newNode = Node<T>(value, prev.next);
    prev.next = newNode;
    _length++;
    return true;
  }

  /// 4. Delete at index -> O(n) Time
  T? deleteAt(int index) {
    if (index < 0 || index >= _length || _head == null) return null;

    if (index == 0) {
      final Node<T> oldHead = _head!;
      final T removedData = oldHead.data;
      _head = _head!.next;
      oldHead.next = null; // Unlink deleted node for Garbage Collector!
      _length--;
      if (_length == 0) _tail = null;
      return removedData;
    }

    final Node<T>? prev = _getNodeAt(index - 1);
    if (prev == null || prev.next == null) return null;

    final Node<T> targetNode = prev.next!;
    prev.next = targetNode.next;
    if (index == _length - 1) {
      _tail = prev;
    }
    targetNode.next = null; // Unlink deleted node for Garbage Collector!
    _length--;
    return targetNode.data;
  }

  /// 5. Reverse Linked List in-place -> O(n) Time / O(1) Auxiliary Space
  void reverse() {
    if (_head == null || _head!.next == null) return;

    Node<T>? prev;
    Node<T>? current = _head;
    _tail = _head;

    while (current != null) {
      final Node<T>? nextNode = current.next;
      current.next = prev;
      prev = current;
      current = nextNode;
    }

    _head = prev;
  }

  /// 6. Helper: Get node at index -> O(n) Time
  Node<T>? _getNodeAt(int index) {
    if (index < 0 || index >= _length) return null;
    Node<T>? current = _head;
    for (int i = 0; i < index; i++) {
      current = current?.next;
    }
    return current;
  }

  /// Convert list to Dart List for visualization
  List<T> toList() {
    final List<T> result = [];
    Node<T>? current = _head;
    while (current != null) {
      result.add(current.data);
      current = current.next;
    }
    return result;
  }

  @override
  String toString() {
    if (_head == null) return 'Empty List';
    final StringBuffer sb = StringBuffer();
    Node<T>? current = _head;
    while (current != null) {
      sb.write('${current.data}');
      if (current.next != null) sb.write(' -> ');
      current = current.next;
    }
    return sb.toString();
  }
}

void main() {
  print('=== 🏗️ SINGLY LINKED LIST DEMO ===');
  final SinglyLinkedList<String> list = SinglyLinkedList<String>();

  print('\n1. Appending elements O(1):');
  list.append('Node_A');
  list.append('Node_B');
  list.append('Node_C');
  print('List: $list (Length: ${list.length})');

  print('\n2. Prepending element O(1) (No array element shifting!):');
  list.prepend('Header_Node');
  print('List: $list');

  print('\n3. Inserting at index 2 O(n):');
  list.insert(2, 'Inserted_Middle');
  print('List: $list');

  print('\n4. Deleting at index 0 O(1):');
  final String? removed = list.deleteAt(0);
  print('Removed: $removed');
  print('List: $list');

  print('\n5. In-Place Reversing List O(n) Time / O(1) Space:');
  list.reverse();
  print('Reversed List: $list');
  print('Head: ${list.head?.data}, Tail: ${list.tail?.data}');
}
