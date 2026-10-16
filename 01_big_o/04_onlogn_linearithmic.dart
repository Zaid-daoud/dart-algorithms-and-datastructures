/// Big O(n log n) - Linearithmic Time Complexity
/// Common in efficient comparison-based sorting algorithms (Merge Sort, Quick Sort).
/// Performs an O(log n) operation for each of the N elements.
library;

void main() {
  final List<int> scores = [45, 12, 89, 3, 99, 23, 67, 10, 55, 100];

  print('Original Unsorted Scores: $scores');

  // Dart\'s List.sort() uses Dual-Pivot Quicksort / TimSort -> O(n log n) average
  scores.sort();

  print('Sorted Scores O(n log n): $scores');
}
