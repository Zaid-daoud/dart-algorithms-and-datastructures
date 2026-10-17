/// Big O(n^2) Quadratic Time vs Big O(n) Linear Time Optimization
///
/// TIME COMPLEXITY:
/// - Nested Loops: O(n^2) Time (~12,500,000 comparisons)
/// - Set Lookup: O(n) Time (5,000 operations)
///
/// SPACE COMPLEXITY (MEMORY):
/// - Nested Loops: O(1) Auxiliary Space (0 extra set elements)
/// - Set Lookup: O(n) Auxiliary Heap Space (stores N items in Hash Set)
/// -> Classic Time-Space Tradeoff: We spend O(n) RAM Memory to gain 2,499x Faster Speed!
library;

void main() {
  final List<String> tags = List.generate(
    5000,
    (i) => i % 2500 == 0 ? 'duplicate_tag' : 'tag_$i',
  );

  print('=== 1. THE BAD WAY: Nested Loops O(n^2) Time / O(1) Space ===');
  final Set<String> duplicatesBad = {};
  int nestedLoopSteps = 0;

  for (int i = 0; i < tags.length; i++) {
    for (int j = i + 1; j < tags.length; j++) {
      nestedLoopSteps++;
      if (tags[i] == tags[j]) {
        duplicatesBad.add(tags[i]);
      }
    }
  }
  print('Nested Loop: Found duplicates = $duplicatesBad');
  print('• Time  : $nestedLoopSteps comparisons O(n^2) 🐢');
  print('• Space : O(1) Auxiliary Memory (0 extra set elements allocated) 💾');

  print('\n=== 2. THE GOOD WAY: Hash Set O(n) Time / O(n) Space ===');
  final Set<String> seen = {};
  final Set<String> duplicatesGood = {};
  int setSteps = 0;

  for (final tag in tags) {
    setSteps++;
    if (!seen.add(tag)) {
      duplicatesGood.add(tag);
    }
  }
  print('Set Lookup: Found duplicates = $duplicatesGood');
  print('• Time  : $setSteps operations O(n) ⚡');
  print(
      '• Space : O(n) Auxiliary RAM Memory (${seen.length} elements in Set) 💾');

  print('\n=== 📊 THE TIME & SPACE TRADEOFF ===');
  print(
      '• Time Advantage : Set lookup is ${nestedLoopSteps ~/ setSteps}x Faster! ⚡');
  print(
      '• Space Tradeoff  : Spent O(n) RAM Heap Memory to reduce operations from 12.5M to 5K! 💾');
}
