/// Big O(n!) Factorial Time Complexity vs $O(n^2)$ and $O(2^n)$
///
/// WHY WE NEED TO AVOID BIG O(n!):
/// Factorial growth is the absolute slowest category.
/// For N = 4: 4! = 24 permutations.
/// For N = 10: 10! = 3,628,800 operations.
/// For N = 20: 20! = 2.4 x 10^18 operations (would crash any phone or server!).
library;

void main() {
  final List<String> items = ['A', 'B', 'C', 'D', 'E']; // N = 5

  print('=== 1. THE FACTORIAL EXPLOSION O(n!) ===');
  int factorialCalls = 0;

  List<List<T>> generatePermutations<T>(List<T> list) {
    factorialCalls++;
    if (list.isEmpty) return [[]];

    final List<List<T>> result = [];
    for (int i = 0; i < list.length; i++) {
      final T current = list[i];
      final List<T> remaining = List.from(list)..removeAt(i);
      final List<List<T>> subPerms = generatePermutations(remaining);

      for (final sub in subPerms) {
        result.add([current, ...sub]);
      }
    }
    return result;
  }

  final List<List<String>> perms = generatePermutations(items);
  print('Permutations generated for $items: ${perms.length} permutations.');
  print('💥 Factorial Calls for N=5: $factorialCalls function calls!');

  print('\n=== 📊 GROWTH RATE COMPARISON FOR N = 10 ===');
  print('• O(1) Constant      : 1 operation ⚡');
  print('• O(log n) Logarithmic: ~3 operations ⚡');
  print('• O(n) Linear        : 10 operations 🟡');
  print('• O(n^2) Quadratic    : 100 operations 🟠');
  print('• O(2^n) Exponential  : 1,024 operations 🔴');
  print('• O(n!) Factorial    : 3,628,800 operations! 💥 (DANGEROUS)');
}
