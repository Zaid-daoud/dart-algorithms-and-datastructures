/// Big O(log n) - Logarithmic Time Complexity vs Big O(n) Linear Time
///
/// TIME COMPLEXITY:
/// - Linear Search: O(n) Time (444,445 steps)
/// - Binary Search: O(log n) Time (18 steps)
///
/// SPACE COMPLEXITY (MEMORY):
/// - Both algorithms run in-place on the sorted list -> O(1) Extra Space!
/// -> Binary Search gives dramatic time improvement WITHOUT any extra memory cost!
library;

void main() {
  // Scenario: Searching for a user ID in a dataset of 1,000,000 sorted users
  final List<int> sortedUserIds = List.generate(
    1000000,
    (i) => i * 2,
  ); // 0, 2, 4, 6...

  final int targetId = 888888;

  print('=== 1. THE BAD WAY: Linear Search O(n) Time / O(1) Space ===');
  int linearSteps = 0;
  int linearResultIndex = -1;

  for (int i = 0; i < sortedUserIds.length; i++) {
    linearSteps++;
    if (sortedUserIds[i] == targetId) {
      linearResultIndex = i;
      break;
    }
  }
  print('Linear Search: Found ID $targetId at index $linearResultIndex');
  print('• Time  : $linearSteps steps O(n) 🐢');
  print('• Space : 0 extra memory allocated O(1) 💾');

  print('\n=== 2. THE GOOD WAY: Binary Search O(log n) Time / O(1) Space ===');
  int binarySteps = 0;

  int binarySearch(List<int> list, int target) {
    int low = 0;
    int high = list.length - 1;

    while (low <= high) {
      binarySteps++;
      final int mid = low + ((high - low) ~/ 2);

      if (list[mid] == target) {
        return mid;
      } else if (list[mid] < target) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }
    return -1;
  }

  final int binaryResultIndex = binarySearch(sortedUserIds, targetId);
  print('Binary Search: Found ID $targetId at index $binaryResultIndex');
  print('• Time  : $binarySteps steps O(log n) ⚡');
  print('• Space : 0 extra memory allocated O(1) 💾');

  print('\n=== 📊 THE TIME & SPACE COMPARISON ===');
  print(
      '• Time Advantage : Binary Search is ${linearSteps ~/ binarySteps}x Faster! ⚡');
  print(
      '• Space Advantage: 0 extra RAM used! Both algorithms are O(1) Space! 💾');
}
