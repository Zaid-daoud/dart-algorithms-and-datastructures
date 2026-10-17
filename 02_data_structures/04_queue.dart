/// Queue Data Structure Implementation in Pure Dart (FIFO - First In, First Out)
///
/// WHAT IS A QUEUE?
/// A linear data structure that follows the FIFO (First In, First Out) principle.
/// The first element enqueued is the first one to be dequeued.
///
/// WHY USE LINKED NODES INSTEAD OF DART LIST FOR QUEUE?
/// - If you use List.removeAt(0) for a Queue, it shifts N elements -> O(n) Time 🐢.
/// - Using Linked Nodes allows O(1) Enqueue AND O(1) Dequeue without array element shifting ⚡!
///
/// REAL-WORLD FLUTTER CONTEXT:
/// - Dart Event Loop & Microtask Queue.
/// - Flutter Stream Controllers / Download Task Managers.
/// - Breadth-First Search (BFS) Graph & Tree traversals.
///
/// TIME COMPLEXITY:
/// - Enqueue (Add Back)    : O(1) Time ⚡
/// - Dequeue (Remove Front): O(1) Time ⚡ (No array element shifting!)
/// - Peek (Inspect Front)  : O(1) Time ⚡
///
/// SPACE COMPLEXITY:
/// - O(n) Heap Memory Space (stores N Node objects).
library;

/// Internal Node for Queue
class QueueNode<T> {
  T data;
  QueueNode<T>? next;

  QueueNode(this.data, [this.next]);
}

/// Custom Node-Based Queue Implementation
class Queue<T> {
  QueueNode<T>? _front;
  QueueNode<T>? _rear;
  int _length = 0;

  // Getters
  bool get isEmpty => _length == 0;
  bool get isNotEmpty => _length > 0;
  int get length => _length;
  T? get front => _front?.data;

  /// 1. Enqueue (Add to back) -> O(1) Time
  void enqueue(T element) {
    final QueueNode<T> newNode = QueueNode<T>(element);
    if (_rear == null) {
      _front = newNode;
      _rear = newNode;
    } else {
      _rear!.next = newNode;
      _rear = newNode;
    }
    _length++;
  }

  /// 2. Dequeue (Remove and return from front) -> O(1) Time (No array shifting!)
  T? dequeue() {
    if (_front == null) return null;

    final T dequeuedData = _front!.data;
    _front = _front!.next;
    _length--;

    if (_front == null) {
      _rear = null;
    }

    return dequeuedData;
  }

  @override
  String toString() {
    if (isEmpty) return 'Queue [Empty]';
    final List<T> items = [];
    QueueNode<T>? current = _front;
    while (current != null) {
      items.add(current.data);
      current = current.next;
    }
    return 'Queue [Front: ${items.join(" <- ")} :Rear]';
  }
}

void main() {
  print('=== 🏗️ QUEUE DEMO (FIFO) ===');
  final Queue<String> downloadQueue = Queue<String>();

  print('\n1. Enqueuing download tasks (Enqueue O(1)):');
  downloadQueue.enqueue('Download_Image_1.png');
  downloadQueue.enqueue('Download_Image_2.png');
  downloadQueue.enqueue('Download_Image_3.png');
  print('Download Queue: $downloadQueue');
  print('Next Task To Process (Front): ${downloadQueue.front}');

  print(
      '\n2. Processing First Task (Dequeue O(1) - No Array Element Shifting!):');
  final String? processedTask = downloadQueue.dequeue();
  print('Processed Task: $processedTask');
  print('Download Queue: $downloadQueue');
  print('Next Task To Process (Front): ${downloadQueue.front}');
}
