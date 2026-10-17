/// Stack Data Structure Implementation in Pure Dart (LIFO - Last In, First Out)
///
/// WHAT IS A STACK?
/// A linear data structure that follows the LIFO (Last In, First Out) principle.
/// The last element pushed onto the stack is the first one to be popped off.
///
/// REAL-WORLD FLUTTER CONTEXT:
/// - Flutter Navigator Stack: Navigator.push() -> push(), Navigator.pop() -> pop().
/// - Undo / Redo operations in text editors.
/// - Call Stack memory execution in Dart VM.
/// - Expression evaluation & Valid Parentheses checking.
///
/// TIME COMPLEXITY:
/// - Push (Add Top)   : O(1) Time ⚡
/// - Pop (Remove Top) : O(1) Time ⚡
/// - Peek (Inspect)   : O(1) Time ⚡
///
/// SPACE COMPLEXITY:
/// - O(n) Heap Memory Space (stores N elements).
library;

/// Custom Stack Implementation
class Stack<T> {
  final List<T> _storage = [];

  /// 1. Push (Add item to top of stack) -> Amortized O(1) Time
  void push(T element) {
    _storage.add(element);
  }

  /// 2. Pop (Remove and return top item) -> O(1) Time
  T? pop() {
    if (isEmpty) return null;
    return _storage.removeLast();
  }

  /// 3. Peek / Top (Inspect top item without removing) -> O(1) Time
  T? get peek => isEmpty ? null : _storage.last;

  // Getters
  bool get isEmpty => _storage.isEmpty;
  bool get isNotEmpty => _storage.isNotEmpty;
  int get length => _storage.length;

  /// Utility to clear stack
  void clear() => _storage.clear();

  @override
  String toString() {
    if (isEmpty) return 'Stack [Empty]';
    return 'Stack [Top: ${_storage.reversed.join(" -> ")}]';
  }
}

void main() {
  print('=== 🏗️ STACK DEMO (LIFO) ===');
  final Stack<String> navigationStack = Stack<String>();

  print('\n1. Navigating to screens (Push O(1)):');
  navigationStack.push('HomeScreen');
  navigationStack.push('ProductDetailsScreen');
  navigationStack.push('CheckoutScreen');
  print('Navigation Stack: $navigationStack');
  print('Current Visible Screen (Peek): ${navigationStack.peek}');

  print('\n2. Pressing Back Button (Pop O(1)):');
  final String? poppedScreen = navigationStack.pop();
  print('Popped Screen: $poppedScreen');
  print('Navigation Stack: $navigationStack');
  print('Current Visible Screen (Peek): ${navigationStack.peek}');

  print('\n3. Emptying Stack:');
  navigationStack.pop();
  navigationStack.pop();
  print('Is Empty: ${navigationStack.isEmpty}');
}
