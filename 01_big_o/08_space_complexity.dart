/// Space Complexity - Memory Allocation Analysis
/// Measures total memory (Stack + Heap) allocated relative to input size N.
///
/// 1. O(1) Space: Constant auxiliary memory (In-place).
/// 2. O(n) Space: Memory scales linearly with N (Creating new List / Set / Map).
/// 3. O(n) Call Stack Space: Recursive call stack depth.
/// 4. O(n^2) Space: 2D Grid / Matrix allocation.
library;

void main() {
  final List<int> numbers = [10, 20, 30, 40, 50];

  // 1. O(1) Auxiliary Space: In-place calculation (Fixed memory usage)
  double sumInPlace(List<int> list) {
    double total = 0; // Fixed double variable
    for (final num in list) {
      total += num;
    }
    return total;
  }

  // 2. O(n) Auxiliary Space: Creating a new list in memory
  List<int> doubleElements(List<int> list) {
    final List<int> result = []; // Allocates memory proportional to N
    for (final num in list) {
      result.add(num * 2);
    }
    return result;
  }

  // 3. O(n) Call Stack Space: Recursion call stack memory
  int recursiveCountdown(int n) {
    if (n <= 0) return 0;
    return 1 +
        recursiveCountdown(n - 1); // Each call adds a frame to call stack
  }

  // 4. O(n^2) Space: Creating an N x N 2D Grid
  List<List<int>> createGrid(int n) {
    return List.generate(n, (_) => List.generate(n, (_) => 0));
  }

  print('O(1) Space Sum Result: ${sumInPlace(numbers)}');
  print('O(n) Space Doubled List: ${doubleElements(numbers)}');
  print('O(n) Call Stack Space Recursion Depth: ${recursiveCountdown(5)}');
  print('O(n^2) Space Grid (3x3): ${createGrid(3)}');
}
