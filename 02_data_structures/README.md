# 🏗️ Data Structures in Pure Dart: Senior Engineer's Guide

A comprehensive architectural reference and executable suite of fundamental **Data Structures implemented from scratch** in pure Dart. This module bridges core Computer Science data layout models with real-world **Dart VM memory pointers, RAM Heap locality, Garbage Collection (GC) pressure, and Flutter production state architectures**.

---

## 🏛️ Senior Architectural Overview: Memory Models in Dart & Flutter

Choosing the right Data Structure is fundamentally a decision about **Memory Layout & Pointer Mechanics**:

1. **Contiguous Memory vs Pointer Chaining:**
   - **Contiguous Allocation (`List` / Array):** Items live sequentially in RAM. Unmatched $O(1)$ index access and CPU Cache Line hits, but element shifting ($O(n)$) during insertions/deletions at arbitrary indices.
   - **Pointer Chaining (`LinkedList` / Nodes):** Nodes live in non-contiguous RAM Heap connected via $O(1)$ pointers (`next` / `prev`). Eliminates element shifting, but sacrifices direct index access.
2. **Memory Locality & Cache Efficiency:**
   Arrays hit CPU cache lines efficiently, whereas node-based structures (`LinkedList`, `BST`, `Graph`) introduce pointer-chasing overhead across RAM Heap blocks.
3. **Garbage Collection (GC) Churn:**
   Frequent creation and deletion of Node wrapper objects adds GC pressure. Senior developers balance $O(1)$ operation speed with object allocation overhead.

---

## 📊 Master Data Structures Summary & Complexity Matrix

| # | Data Structure | Lookup / Search | Insert (Front / Back) | Delete (Front / Back) | Space Complexity | Memory Model | Senior Flutter Production Use-Cases |
|---|:---|:---|:---|:---|:---|:---|:---|
| 01 | [`01_singly_linked_list.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/02_data_structures/01_singly_linked_list.dart) | $O(n)$ | $O(1)$ / $O(1)$ | $O(1)$ / $O(n)$ | $O(n)$ Heap Space | Forward Node Pointers | Infinite feed prepending without element shifting |
| 02 | [`02_doubly_linked_list.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/02_data_structures/02_doubly_linked_list.dart) | $O(n)$ | $O(1)$ / $O(1)$ | $O(1)$ / $O(1)$ | $O(n)$ Heap Space | Two-way Pointers (`prev`/`next`) | LRU Memory Cache, Browser Back/Forward history |
| 03 | [`03_stack.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/02_data_structures/03_stack.dart) | $O(n)$ | $O(1)$ (Push) | $O(1)$ (Pop) | $O(n)$ Heap Space | LIFO (Last In, First Out) | `Navigator.push()` / `pop()`, Undo/Redo buffers |
| 04 | [`04_queue.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/02_data_structures/04_queue.dart) | $O(n)$ | $O(1)$ (Enqueue) | $O(1)$ (Dequeue) | $O(n)$ Heap Space | FIFO (First In, First Out) | Event Loop, Microtask Queue, Stream Controllers |
| 05 | [`05_custom_hash_table.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/02_data_structures/05_custom_hash_table.dart) | $O(1)$ Avg | $O(1)$ Avg | $O(1)$ Avg | $O(n)$ Heap Space | Bucket Array + Chaining | Instant state caching, API response indexing |
| 06 | [`06_binary_search_tree.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/02_data_structures/06_binary_search_tree.dart) | $O(\log n)$ Avg | $O(\log n)$ Avg | $O(\log n)$ Avg | $O(n)$ Heap Space | Hierarchical Tree Nodes | Sorted range queries, autocomplete index engines |
| 07 | [`07_min_max_heap.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/02_data_structures/07_min_max_heap.dart) | $O(1)$ (Peek) | $O(\log n)$ | $O(\log n)$ | $O(n)$ Heap Space | Array-backed Complete Tree | Priority Task Scheduler, Top-K data streams |
| 08 | [`08_graph.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/02_data_structures/08_graph.dart) | $O(V + E)$ | $O(1)$ | $O(V + E)$ | $O(V + E)$ Heap Space | Adjacency List Map | Riverpod/Bloc Dependency DAG, Shortest Path routing |
| -- | [`main_data_structures.dart`](file:///Users/zaiddaoud/Documents/dart-algorithms-and-datastructures/02_data_structures/main_data_structures.dart) | -- | -- | -- | -- | Master Executable Suite | Runs all 8 data structure implementations |

---

## 📖 Deep Architecture & Implementation Breakdown

### 1. Singly Linked List (`01_singly_linked_list.dart`)
- **Memory Mechanics:** `Node<T>` objects linked via unidirectional `next` pointers.
- **Flutter Context:** Adding elements at the top of a stream/feed in $O(1)$ time without forcing Dart VM to shift contiguous array elements in memory.
- **Key Operations:** `prepend(value)` $O(1)$, `append(value)` $O(1)$, `reverse()` $O(n)$ in-place.

### 2. Doubly Linked List (`02_doubly_linked_list.dart`)
- **Memory Mechanics:** Nodes store both `next` and `prev` pointers.
- **Why It Matters:** Enables $O(1)$ tail node removal! In a Singly Linked List, removing the tail takes $O(n)$ because reaching the second-to-last node requires traversing the whole list.
- **Flutter Context:** **LRU (Least Recently Used) Memory Cache** for network images or audio player history.

### 3. Stack — LIFO (`03_stack.dart`)
- **Memory Mechanics:** Restricted access container where insertion and deletion occur strictly at the top.
- **Flutter Context:** Flutter's imperator `Navigator` uses a Stack (`Navigator.push()` / `Navigator.pop()`). Call stack memory allocation in Dart VM isolates.

### 4. Queue — FIFO (`04_queue.dart`)
- **Memory Mechanics:** Implemented via Linked Nodes to achieve $O(1)$ `dequeue()` without array element shifting ($O(n)$ in `List.removeAt(0)`).
- **Flutter Context:** Dart Event Loop, Microtask Queue, background isolate task processing.

### 5. Custom Hash Table & Collisions (`05_custom_hash_table.dart`)
- **Memory Mechanics:** Arrays of buckets with **Separate Chaining** for collision resolution and **Automatic Resizing (Load Factor $\ge 0.75$)**.
- **Flutter Context:** `Map<K, V>` caching for instant $O(1)$ model lookups in Riverpod / Bloc repositories.

### 6. Binary Search Tree — BST (`06_binary_search_tree.dart`)
- **Memory Mechanics:** Nodes storing left ($<$) and right ($\ge$) child pointers.
- **Traversals:** `In-Order` (Returns sorted list!), `Pre-Order`, `Post-Order`, `Level-Order (BFS)`.
- **Flutter Context:** Hierarchical state trees, autocomplete search indexing.

### 7. Min & Max Heap / Priority Queue (`07_min_max_heap.dart`)
- **Memory Mechanics:** Complete Binary Tree stored inside a contiguous array using index formulas:
  $$\text{Parent}(i) = (i - 1) \mathbin{\sim/} 2, \quad \text{Left}(i) = 2i + 1, \quad \text{Right}(i) = 2i + 2$$
- **Flutter Context:** Priority task scheduling (executing critical network/frame tasks before background pre-fetching).

### 8. Graph & Traversals (`08_graph.dart`)
- **Memory Mechanics:** Represented as an Adjacency List `Map<T, List<T>>` ($O(V + E)$ Space).
- **Traversals:**
  - **BFS (Queue):** Level-by-level shortest path in unweighted graphs.
  - **DFS (Recursion/Stack):** Deep branch exploration, cycle detection, topological sorting.
- **Flutter Context:** Riverpod/Bloc state dependency graphs (DAG - Directed Acyclic Graph) and navigation routing.

---

## 🇸🇦 الدليل المعماري التفصيلي لمهندسي البرمجيات (Senior Level)

### 📌 نماذج الذاكرة وهياكل البيانات في Dart و Flutter

اختيار هيكل البيانات المناسب ليس مجرد حفظ لخوارزميات البحث والإضافة، بل هو **قرار معماري يتلق بالذاكرة (RAM Layout) وأداء المحرك (Engine Performance)**:

1. **الذاكرة المتصلة (Contiguous Array) مقابل سلاسل المؤشرات (Pointer Chaining):**
   - **الـ `List` العادية:** تخزن العناصر متجاورة في الـ RAM. تمنحك وصولاً لحظياً بـ $O(1)$ عبر الـ Index وتستفيد من سرعة كاش المعالج (CPU Cache Line Hits)، لكن عيبها الإزاحة المكلفة $O(n)$ عند الحذف أو الإضافة في بداية القائمة.
   - **الـ `LinkedList` العقدية:** تخزن البيانات في أماكن متفرقة في الـ Heap موصولة بـ Pointers. تمنحك إضافة وحذف لحظي بـ $O(1)$ في أي مكان بدون إزاحة، لكنها تفقد خاصية الوصول المباشر بـ Index.

2. **ضغط جامع القمامة (Garbage Collection Churn):**
   إنشاء ملايين الـ Node Objects الصغيرة في الهياكل الشجرية يضغط على جامع القمامة (GC) في Dart. لذلك يفضل المطور المحترف استخدام **Binary Heap** الممثلة داخل مصفوفة عادية لحساب الـ Priority Queue بنفس السرعة وبدون استهلاك كائنات إضافية!

---

### 🏃 How to Run | طريقة التشغيل

لتشغيل كود الاختبار الشامل لجميع الهياكل الثمانية:
```bash
dart run 02_data_structures/main_data_structures.dart
```

أو تشغيل أي ملف فردي:
```bash
dart run 02_data_structures/01_singly_linked_list.dart
dart run 02_data_structures/02_doubly_linked_list.dart
dart run 02_data_structures/03_stack.dart
dart run 02_data_structures/04_queue.dart
dart run 02_data_structures/05_custom_hash_table.dart
dart run 02_data_structures/06_binary_search_tree.dart
dart run 02_data_structures/07_min_max_heap.dart
dart run 02_data_structures/08_graph.dart
```
