/// Big O(n log n) - Linearithmic Time Complexity vs Big O(n^2) Bubble Sort
///
/// TIME COMPLEXITY:
/// - Bubble Sort: O(n^2) Time (~12,500,000 comparisons)
/// - Quicksort (List.sort()): O(n log n) Time (~65,000 operations)
///
/// SPACE COMPLEXITY (MEMORY):
/// - Bubble Sort: O(1) Auxiliary Space (In-place swaps)
/// - Quicksort (List.sort()): O(log n) Auxiliary Call Stack Memory for recursion depth!
library;

void main() {
  final List<int> numbersForBubble = List.generate(5000, (i) => 5000 - i);
  final List<int> numbersForQuick = List.from(numbersForBubble);

  print('=== 1. THE BAD WAY: Bubble Sort O(n^2) Time / O(1) Space ===');
  int bubbleComparisons = 0;

  for (int i = 0; i < numbersForBubble.length; i++) {
    for (int j = 0; j < numbersForBubble.length - i - 1; j++) {
      bubbleComparisons++;
      if (numbersForBubble[j] > numbersForBubble[j + 1]) {
        final int temp = numbersForBubble[j];
        numbersForBubble[j] = numbersForBubble[j + 1];
        numbersForBubble[j + 1] = temp;
      }
    }
  }
  print('Bubble Sort completed.');
  print('• Time  : $bubbleComparisons comparisons O(n^2) 🐢');
  print('• Space : O(1) Auxiliary Memory (In-place swaps) 💾');

  print(
      '\n=== 2. THE GOOD WAY: Dart List.sort() O(n log n) Time / O(log n) Space ===');
  // Dart List.sort() uses Dual-Pivot Quicksort / TimSort -> O(n log n)
  // Estimated operations for N = 5,000: N * log2(N) ≈ 5000 * 13 ≈ 65,000 ops
  numbersForQuick.sort();
  final int quickOperationsEstimate = 5000 * 13;

  print('Dart List.sort() completed.');
  print('• Time  : ~$quickOperationsEstimate operations O(n log n) ⚡');
  print(
      '• Space : O(log n) Auxiliary Call Stack Memory for recursion depth 💾');

  print('\n=== 📊 THE TIME & SPACE COMPARISON ===');
  print(
      '• Time Advantage : List.sort() is ~${bubbleComparisons ~/ quickOperationsEstimate}x Faster! ⚡');
  print(
      '• Space Tradeoff : List.sort() uses small O(log n) Call Stack frames for recursion! 💾');
}
