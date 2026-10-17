import '01_singly_linked_list.dart' as singly_list;
import '02_doubly_linked_list.dart' as doubly_list;
import '03_stack.dart' as stack;
import '04_queue.dart' as queue;
import '05_custom_hash_table.dart' as hash_table;
import '06_binary_search_tree.dart' as bst;
import '07_min_max_heap.dart' as heap;
import '08_graph.dart' as graph;

void main() {
  print('====================================================');
  print('  🏗️ DATA STRUCTURES SUITE - MASTER EXECUTABLE');
  print('====================================================');

  print('\n----------------------------------------------------');
  print('1. SINGLY LINKED LIST');
  print('----------------------------------------------------');
  singly_list.main();

  print('\n----------------------------------------------------');
  print('2. DOUBLY LINKED LIST');
  print('----------------------------------------------------');
  doubly_list.main();

  print('\n----------------------------------------------------');
  print('3. STACK (LIFO)');
  print('----------------------------------------------------');
  stack.main();

  print('\n----------------------------------------------------');
  print('4. QUEUE (FIFO)');
  print('----------------------------------------------------');
  queue.main();

  print('\n----------------------------------------------------');
  print('5. CUSTOM HASH TABLE');
  print('----------------------------------------------------');
  hash_table.main();

  print('\n----------------------------------------------------');
  print('6. BINARY SEARCH TREE (BST)');
  print('----------------------------------------------------');
  bst.main();

  print('\n----------------------------------------------------');
  print('7. MIN HEAP & PRIORITY QUEUE');
  print('----------------------------------------------------');
  heap.main();

  print('\n----------------------------------------------------');
  print('8. GRAPH (ADJACENCY LIST, BFS, DFS)');
  print('----------------------------------------------------');
  graph.main();

  print('\n====================================================');
  print('  ✅ DATA STRUCTURES SUITE COMPLETED SUCCESSFULLY');
  print('====================================================');
}
