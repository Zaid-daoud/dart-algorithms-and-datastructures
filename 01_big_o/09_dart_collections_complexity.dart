/// Dart Collections Complexity (List vs Set vs Map vs Queue)
///
/// Demonstrates hidden performance traps in Dart collections:
/// 1. List.insert(0, item) O(n) vs List.add(item) O(1)
/// 2. List.removeAt(0) O(n) vs Queue.removeFirst() O(1)
/// 3. Map.containsKey(k) O(1) vs Map.containsValue(v) O(n)
library;

import 'dart:collection';

void main() {
  final List<int> list = List.generate(100000, (i) => i);
  final Queue<int> queue = Queue.from(list);
  final Map<String, int> map = {
    for (int i = 0; i < 100000; i++) 'key_$i': i,
  };

  print('=== 1. LIST INSERT AT START O(n) vs LIST ADD AT END O(1) ===');
  // List.insert(0, item) requires shifting all N items to the right -> O(n)
  final int insertSteps = list.length;
  list.insert(0, -1);
  print('List.insert(0, item) O(n) shifted $insertSteps elements! 🐢');

  // List.add(item) appends at the end without shifting -> Amortized O(1)
  list.add(100000);
  print('List.add(item) Amortized O(1) appended directly! ⚡');

  print('\n=== 2. LIST REMOVE AT START O(n) vs QUEUE REMOVE FIRST O(1) ===');
  // List.removeAt(0) shifts N items -> O(n)
  list.removeAt(0);
  print('List.removeAt(0) O(n) shifted remaining elements 🐢');

  // Queue.removeFirst() updates head pointer -> O(1)
  queue.removeFirst();
  print('Queue.removeFirst() O(1) removed in 1 step! ⚡');

  print('\n=== 3. MAP CONTAINS KEY O(1) vs MAP CONTAINS VALUE O(n) ===');
  // map.containsKey() uses Hash Lookup -> O(1)
  final bool hasKey = map.containsKey('key_99999');
  print('Map.containsKey() O(1): $hasKey in 1 step! ⚡');

  // map.containsValue() scans every value in the map -> O(n)
  final bool hasValue = map.containsValue(99999);
  print('Map.containsValue() O(n): $hasValue scanned 100,000 values 🐢');
}
