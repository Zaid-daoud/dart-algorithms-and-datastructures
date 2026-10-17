/// Custom Hash Table Implementation in Pure Dart (Separate Chaining with Nodes)
///
/// WHAT IS A HASH TABLE?
/// A data structure that stores key-value pairs (`Map<K, V>`).
/// Uses a Hash Function to map keys to integer bucket indices.
///
/// HASH COLLISIONS & SEPARATE CHAINING WITH NODES:
/// When two distinct keys compute to the exact same bucket index (Collision!),
/// we resolve it using pure "Node Pointer Chaining" (`HashNode<K, V>` linked list).
///
/// LOAD FACTOR & RESIZING:
/// When elements / buckets >= 0.75 (Load Factor), the table doubles its capacity and
/// re-hashes all keys to maintain fast O(1) Average Lookup Time!
///
/// TIME COMPLEXITY:
/// - Put (Insert / Update) : O(1) Average / O(n) Worst Case (if all keys collide into 1 bucket)
/// - Get (Lookup)          : O(1) Average / O(n) Worst Case
/// - Remove                : O(1) Average / O(n) Worst Case
///
/// SPACE COMPLEXITY:
/// - O(n) Heap Memory Space (buckets array + HashNode chains).
library;

/// Pure HashNode Class for Linked Bucket Chains
class HashNode<K, V> {
  final K key;
  V value;
  HashNode<K, V>? next;

  HashNode(this.key, this.value, [this.next]);

  @override
  String toString() => '$key: $value';
}

/// Custom Hash Table Implementation using Pure Node Chaining
class CustomHashTable<V> {
  int _capacity;
  static const double _loadFactorThreshold = 0.75;
  int _size = 0;

  late List<HashNode<String, V>?> _buckets;

  CustomHashTable([this._capacity = 8]) {
    _buckets = List.generate(_capacity, (_) => null);
  }

  // Getters
  int get size => _size;
  int get capacity => _capacity;
  bool get isEmpty => _size == 0;
  double get currentLoadFactor => _size / _capacity;

  /// Custom Hash Function: Hashes String key into bucket index [0 ... capacity - 1]
  int _hash(String key) {
    int hash = 0;
    for (int i = 0; i < key.length; i++) {
      hash = (hash * 31 + key.codeUnitAt(i)) % _capacity;
    }
    return hash.abs();
  }

  /// 1. Put (Insert or Update key-value pair using Node Chaining) -> O(1) Average Time
  void put(String key, V value) {
    if (currentLoadFactor >= _loadFactorThreshold) {
      _resize();
    }

    final int index = _hash(key);
    final HashNode<String, V>? head = _buckets[index];

    // Check if key already exists (Update)
    HashNode<String, V>? current = head;
    while (current != null) {
      if (current.key == key) {
        current.value = value;
        return;
      }
      current = current.next;
    }

    // Key doesn't exist -> Prepend new HashNode to bucket chain in O(1) Time!
    final HashNode<String, V> newNode = HashNode<String, V>(key, value, head);
    _buckets[index] = newNode;
    _size++;
  }

  /// 2. Get (Lookup value by key through Node Chain) -> O(1) Average Time
  V? get(String key) {
    final int index = _hash(key);
    HashNode<String, V>? current = _buckets[index];

    while (current != null) {
      if (current.key == key) {
        return current.value;
      }
      current = current.next;
    }
    return null;
  }

  /// 3. Remove (Delete Node entry by key) -> O(1) Average Time
  V? remove(String key) {
    final int index = _hash(key);
    HashNode<String, V>? current = _buckets[index];
    HashNode<String, V>? prev;

    while (current != null) {
      if (current.key == key) {
        if (prev == null) {
          // Deleting head node of bucket chain
          _buckets[index] = current.next;
        } else {
          // Unlinking middle/tail node from chain
          prev.next = current.next;
        }
        current.next = null; // Unlink node for Garbage Collector
        _size--;
        return current.value;
      }
      prev = current;
      current = current.next;
    }
    return null;
  }

  /// 4. Contains Key -> O(1) Average Time
  bool containsKey(String key) => get(key) != null;

  /// Resizes bucket array when Load Factor >= 0.75
  void _resize() {
    print(
      '⚡ Load Factor (${currentLoadFactor.toStringAsFixed(2)}) reached threshold! Resizing capacity $_capacity -> ${_capacity * 2}...',
    );
    final List<HashNode<String, V>?> oldBuckets = _buckets;

    _capacity *= 2;
    _size = 0;
    _buckets = List.generate(_capacity, (_) => null);

    // Re-hash all existing Nodes into new bucket array
    for (final head in oldBuckets) {
      HashNode<String, V>? current = head;
      while (current != null) {
        put(current.key, current.value);
        current = current.next;
      }
    }
  }

  @override
  String toString() {
    final StringBuffer sb =
        StringBuffer('HashTable (Size: $_size, Capacity: $_capacity):\n');
    for (int i = 0; i < _capacity; i++) {
      if (_buckets[i] != null) {
        final List<String> chain = [];
        HashNode<String, V>? current = _buckets[i];
        while (current != null) {
          chain.add('${current.key}: ${current.value}');
          current = current.next;
        }
        sb.writeln('  Bucket [$i]: ${chain.join(" -> ")}');
      }
    }
    return sb.toString();
  }
}

void main() {
  print('=== 🏗️ CUSTOM HASH TABLE DEMO (Pure HashNode Chaining) ===');
  final CustomHashTable<String> userCache =
      CustomHashTable<String>(4); // Initial capacity 4

  print('\n1. Inserting key-value pairs (Put O(1) Avg):');
  userCache.put('user_1', 'Ahmed');
  userCache.put('user_2', 'Sara');
  userCache.put('user_3', 'Mohamed');
  print(userCache);

  print('\n2. Triggering Automatic Table Resizing (Load Factor >= 0.75):');
  userCache.put('user_4', 'Omar'); // Triggers resize from capacity 4 -> 8
  userCache.put('user_5', 'Ali');
  print(userCache);

  print('\n3. Hash Lookup O(1) Avg:');
  print('Get "user_3": ${userCache.get("user_3")}');
  print('Contains "user_5": ${userCache.containsKey("user_5")}');

  print('\n4. Removing key "user_2":');
  userCache.remove('user_2');
  print('Get "user_2": ${userCache.get("user_2")}');
  print(userCache);
}
