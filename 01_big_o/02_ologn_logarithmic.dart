/// Big O(log n) - Logarithmic Time Complexity
/// The input/problem size is halved at every single step.
/// Extremely efficient: searching 1,000,000 items takes at most ~20 steps!
library;

void main() {
  // Sorted list required for Binary Search
  final List<int> sortedUserIds = List.generate(
    1000000,
    (i) => i * 2,
  ); // 0, 2, 4, 6...

  final int targetId = 888888;
  int steps = 0;

  // Binary Search Implementation -> O(log n)
  int binarySearch(List<int> list, int target) {
    int low = 0;
    int high = list.length - 1;

    while (low <= high) {
      steps++;
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

  final int index = binarySearch(sortedUserIds, targetId);
  print('O(log n) Binary Search: Found ID $targetId at index $index');
  print('Took only $steps steps for a list of ${sortedUserIds.length} items!');
}
