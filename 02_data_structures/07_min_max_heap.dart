/// Min Heap, Max Heap, and Priority Queue Implementation in Pure Dart
///
/// WHAT IS A BINARY HEAP?
/// A Complete Binary Tree implemented efficiently as a contiguous ARRAY/LIST.
///
/// ARRAY INDEX FORMULAS for node at index i:
/// - Parent Index      : (i - 1) ~/ 2
/// - Left Child Index  : 2 * i + 1
/// - Right Child Index : 2 * i + 2
///
/// HEAP PROPERTY:
/// - Min Heap: Parent is ALWAYS SMALLER than or equal to its children (Root is MINIMUM).
/// - Max Heap: Parent is ALWAYS GREATER than or equal to its children (Root is MAXIMUM).
///
/// TIME COMPLEXITY:
/// - Peek Min/Max  : O(1) Time ⚡ (Root is at index 0)
/// - Insert        : O(log n) Time ⚡ (Performs Heapify-Up)
/// - Extract Min/Max: O(log n) Time ⚡ (Performs Heapify-Down)
///
/// SPACE COMPLEXITY:
/// - O(n) Heap Memory Space.
library;

/// Min Heap Implementation
class MinHeap<T extends Comparable<dynamic>> {
  final List<T> _heap = [];

  // Getters
  int get length => _heap.length;
  bool get isEmpty => _heap.isEmpty;
  bool get isNotEmpty => _heap.isNotEmpty;

  /// Peek Minimum element -> O(1) Time
  T? get peek => isEmpty ? null : _heap[0];

  /// 1. Insert value into Min Heap -> O(log n) Time
  void insert(T value) {
    _heap.add(value);
    _heapifyUp(_heap.length - 1);
  }

  /// 2. Extract Minimum element from Min Heap -> O(log n) Time
  T? extractMin() {
    if (isEmpty) return null;

    final T minValue = _heap[0];
    final T lastValue = _heap.removeLast();

    if (isNotEmpty) {
      _heap[0] = lastValue;
      _heapifyDown(0);
    }

    return minValue;
  }

  /// Helper: Heapify Up (Percolate Up)
  void _heapifyUp(int index) {
    int current = index;
    while (current > 0) {
      final int parent = (current - 1) ~/ 2;
      if (_heap[current].compareTo(_heap[parent]) < 0) {
        _swap(current, parent);
        current = parent;
      } else {
        break;
      }
    }
  }

  /// Helper: Heapify Down (Percolate Down)
  void _heapifyDown(int index) {
    int current = index;

    while (true) {
      final int left = 2 * current + 1;
      final int right = 2 * current + 2;
      int smallest = current;

      if (left < _heap.length && _heap[left].compareTo(_heap[smallest]) < 0) {
        smallest = left;
      }
      if (right < _heap.length && _heap[right].compareTo(_heap[smallest]) < 0) {
        smallest = right;
      }

      if (smallest != current) {
        _swap(current, smallest);
        current = smallest;
      } else {
        break;
      }
    }
  }

  void _swap(int i, int j) {
    final T temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }

  @override
  String toString() => _heap.toString();
}

/// Task item for Priority Queue
class PriorityTask implements Comparable<PriorityTask> {
  final String title;
  final int priority; // Lower number = Higher Priority (1 = Urgent)

  PriorityTask(this.title, this.priority);

  @override
  int compareTo(PriorityTask other) => priority.compareTo(other.priority);

  @override
  String toString() => '[$title (Priority: $priority)]';
}

void main() {
  print('=== 🏗️ MIN HEAP & PRIORITY QUEUE DEMO ===');
  final MinHeap<int> minHeap = MinHeap<int>();

  print('\n1. Inserting unsorted numbers [35, 10, 20, 5, 50, 1]:');
  for (final num in [35, 10, 20, 5, 50, 1]) {
    minHeap.insert(num);
  }
  print('Internal Heap Array: $minHeap');
  print('Minimum Value (Peek O(1)): ${minHeap.peek}');

  print('\n2. Extracting Minimum elements in Order O(log n):');
  final List<int> sortedExtraction = [];
  while (minHeap.isNotEmpty) {
    sortedExtraction.add(minHeap.extractMin()!);
  }
  print('Extracted Min Sequence (Heap Sort): $sortedExtraction');

  print('\n=== 🎯 PRIORITY QUEUE DEMO ===');
  final MinHeap<PriorityTask> taskQueue = MinHeap<PriorityTask>();

  taskQueue.insert(PriorityTask('Render UI Animations', 3));
  taskQueue.insert(PriorityTask('CRITICAL: Out Of Memory Event', 1));
  taskQueue.insert(PriorityTask('Fetch Network Banner', 2));

  print('\nProcessing Priority Tasks in Order of Urgency:');
  while (taskQueue.isNotEmpty) {
    print('Processing: ${taskQueue.extractMin()}');
  }
}
