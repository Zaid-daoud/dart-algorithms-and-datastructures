/// Big O(n!) - Factorial Time Complexity
/// The slowest complexity category. Grows extremely fast!
/// Example: Generating all possible permutations of a list/string.
///
/// For N = 3: 3! = 6 permutations.
/// For N = 10: 10! = 3,628,800 permutations.
/// For N = 20: 20! = 2,432,902,008,176,640,000 permutations!
library;

void main() {
  int functionInvocations = 0;

  // Generates all permutations of a list -> O(n!)
  List<List<T>> generatePermutations<T>(List<T> items) {
    functionInvocations++;
    if (items.isEmpty) return [[]];

    final List<List<T>> result = [];
    for (int i = 0; i < items.length; i++) {
      final T current = items[i];
      final List<T> remaining = List.from(items)..removeAt(i);
      final List<List<T>> subPermutations = generatePermutations(remaining);

      for (final sub in subPermutations) {
        result.add([current, ...sub]);
      }
    }
    return result;
  }

  final List<String> letters = [
    'A',
    'B',
    'C',
    'D',
  ]; // N = 4 (4! = 24 permutations)
  final List<List<String>> perms = generatePermutations(letters);

  print(
    'O(n!) Permutations for $letters (${letters.length}! = ${perms.length} permutations):',
  );
  print(
    'Generated ${perms.length} permutations in total ($functionInvocations function calls).',
  );
}
