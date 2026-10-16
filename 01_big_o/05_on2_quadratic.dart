/// Big O(n^2) - Quadratic Time Complexity
/// Execution time scales quadratically with input size N (N * N).
/// Often occurs with nested loops operating on the same collection.
library;

void main() {
  final List<String> tags = [
    'flutter',
    'dart',
    'mobile',
    'dart',
    'ui',
    'flutter',
  ];

  // Example 1: Finding duplicate tags using nested loops -> O(n^2)
  final Set<String> duplicates = {};
  int comparisons = 0;

  for (int i = 0; i < tags.length; i++) {
    for (int j = i + 1; j < tags.length; j++) {
      comparisons++;
      if (tags[i] == tags[j]) {
        duplicates.add(tags[i]);
      }
    }
  }

  print(
    'O(n^2) Duplicate Finding: $duplicates ($comparisons comparisons for ${tags.length} items)',
  );

  // Example 2: Optimizing duplicate detection using Set -> O(n) Time
  final Set<String> seen = {};
  final Set<String> optimizedDuplicates = {};
  for (final tag in tags) {
    if (!seen.add(tag)) {
      optimizedDuplicates.add(tag);
    }
  }
  print('Optimized O(n) Duplicate Finding: $optimizedDuplicates');
}
