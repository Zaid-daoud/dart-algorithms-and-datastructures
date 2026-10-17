/// Graph Data Structure (Adjacency List) & Traversals (BFS / DFS) in Pure Dart
///
/// WHAT IS A GRAPH?
/// A non-linear data structure consisting of Vertices (Nodes) and Edges (Connections).
///
/// GRAPH REPRESENTATIONS:
/// 1. Adjacency List: `Map<T, List<T>>` -> Memory efficient O(V + E) Space ⚡
/// 2. Adjacency Matrix: 2D Grid V x V -> O(V^2) Space
///
/// GRAPH TRAVERSALS:
/// 1. Breadth-First Search (BFS): Level-by-level traversal using QUEUE.
///    -> Finds SHORTEST PATH in unweighted graphs!
/// 2. Depth-First Search (DFS)  : Explores deeply along branches using RECURSION/STACK.
///    -> Useful for cycle detection, topological sorting, solving mazes.
///
/// TIME COMPLEXITY:
/// - Add Vertex / Edge : O(1) Time ⚡
/// - BFS / DFS Traversal: O(V + E) Time where V = Vertices, E = Edges
///
/// SPACE COMPLEXITY:
/// - O(V + E) Heap Memory Space.
library;

import 'dart:collection';

/// Graph Implementation using Adjacency List
class Graph<T> {
  final Map<T, List<T>> _adjacencyList = {};

  // Getters
  Map<T, List<T>> get adjacencyList => Map.unmodifiable(_adjacencyList);
  int get vertexCount => _adjacencyList.length;

  /// 1. Add Vertex -> O(1) Time
  void addVertex(T vertex) {
    _adjacencyList.putIfAbsent(vertex, () => []);
  }

  /// 2. Add Edge -> O(1) Time
  void addEdge(T source, T destination, {bool isDirected = false}) {
    addVertex(source);
    addVertex(destination);

    _adjacencyList[source]!.add(destination);
    if (!isDirected) {
      _adjacencyList[destination]!.add(source);
    }
  }

  /// 3. Breadth-First Search (BFS) -> O(V + E) Time / O(V) Space
  List<T> breadthFirstSearch(T startVertex) {
    final List<T> result = [];
    if (!_adjacencyList.containsKey(startVertex)) return result;

    final Set<T> visited = {};
    final Queue<T> queue = Queue<T>();

    visited.add(startVertex);
    queue.add(startVertex);

    while (queue.isNotEmpty) {
      final T current = queue.removeFirst();
      result.add(current);

      final List<T>? neighbors = _adjacencyList[current];
      if (neighbors != null) {
        for (final neighbor in neighbors) {
          if (!visited.contains(neighbor)) {
            visited.add(neighbor);
            queue.add(neighbor);
          }
        }
      }
    }

    return result;
  }

  /// 4. Depth-First Search (DFS Recursive) -> O(V + E) Time / O(V) Space
  List<T> depthFirstSearch(T startVertex) {
    final List<T> result = [];
    if (!_adjacencyList.containsKey(startVertex)) return result;

    final Set<T> visited = {};
    _dfsRecursive(startVertex, visited, result);
    return result;
  }

  void _dfsRecursive(T vertex, Set<T> visited, List<T> result) {
    visited.add(vertex);
    result.add(vertex);

    final List<T>? neighbors = _adjacencyList[vertex];
    if (neighbors != null) {
      for (final neighbor in neighbors) {
        if (!visited.contains(neighbor)) {
          _dfsRecursive(neighbor, visited, result);
        }
      }
    }
  }

  @override
  String toString() {
    final StringBuffer sb = StringBuffer('Graph Adjacency List:\n');
    _adjacencyList.forEach((vertex, neighbors) {
      sb.writeln('  $vertex -> [${neighbors.join(", ")}]');
    });
    return sb.toString();
  }
}

void main() {
  print('=== 🏗️ GRAPH DEMO (Adjacency List, BFS, DFS) ===');
  final Graph<String> socialNetwork = Graph<String>();

  print('\n1. Creating Social Network Graph Connections:');
  socialNetwork.addEdge('Ahmed', 'Sara');
  socialNetwork.addEdge('Ahmed', 'Mohamed');
  socialNetwork.addEdge('Sara', 'Ali');
  socialNetwork.addEdge('Mohamed', 'Omar');
  socialNetwork.addEdge('Ali', 'Omar');

  print(socialNetwork);

  print('2. Breadth-First Search (BFS - Level-by-Level Shortest Connections):');
  final List<String> bfsResult = socialNetwork.breadthFirstSearch('Ahmed');
  print('• BFS Traversal from Ahmed: ${bfsResult.join(" -> ")}');

  print('\n3. Depth-First Search (DFS - Deep Branch Exploration):');
  final List<String> dfsResult = socialNetwork.depthFirstSearch('Ahmed');
  print('• DFS Traversal from Ahmed: ${dfsResult.join(" -> ")}');
}
