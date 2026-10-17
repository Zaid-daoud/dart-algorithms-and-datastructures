/// Space Complexity - In-Place O(1) Memory vs Extra Allocations O(n)
///
/// WHY WE NEED SPACE COMPLEXITY ANALYSIS:
/// Allocating new lists or deep recursion call stacks consumes RAM Heap and Stack memory.
/// In mobile devices (Flutter), excessive memory allocations trigger garbage collection lag
/// or cause Out-Of-Memory (OOM) app crashes!
library;

void main() {
  final List<int> numbers = List.generate(1000000, (i) => i);

  print('=== 1. THE BAD WAY: Creating new List O(n) Space ===');
  // Bad Way: Allocates 1,000,000 new integers in RAM Heap memory
  List<int> doubleElementsBad(List<int> list) {
    final List<int> result = []; // O(n) Heap Space
    for (final num in list) {
      result.add(num * 2);
    }
    return result;
  }

  final List<int> doubledList = doubleElementsBad(numbers);
  print('O(n) Space: Created new list of length ${doubledList.length}');
  print(
      '❌ Bad Way Memory: Allocated 1,000,000 extra integer elements in RAM Heap!');

  print('\n=== 2. THE GOOD WAY: In-Place Accumulation O(1) Space ===');
  // Good Way: Accumulates sum into a single double variable without allocating new lists
  double sumInPlace(List<int> list) {
    double total = 0; // O(1) Fixed Memory Allocation
    for (final num in list) {
      total += num;
    }
    return total;
  }

  final double totalSum = sumInPlace(numbers);
  print('O(1) Space: Sum = $totalSum');
  print(
      '✅ Good Way Memory: Allocated 0 extra list elements (Used only 1 fixed variable)!');

  print('\n=== 📊 THE SPACE COMPLEXITY SUMMARY ===');
  print('• O(1) In-Place Space  : Fixed memory usage regardless of N ⚡');
  print('• O(n) Heap Memory Space : Allocates memory proportional to N 💾');
  print('• O(n) Call Stack Space  : Frame allocation per recursion depth 🥞');
  print('• O(n^2) Matrix Space    : Allocates N x N 2D grid elements ⏹️');
}
