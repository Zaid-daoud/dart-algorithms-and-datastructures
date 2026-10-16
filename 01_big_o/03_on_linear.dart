/// Big O(n) - Linear Time Complexity
/// Execution time grows proportionally with input size (N).
///
/// Also demonstrates Best Case O(1) vs Worst Case O(n).
library;

void main() {
  final List<String> notifications = List.generate(
    100000,
    (i) => 'Notification #$i',
  );

  // 1. Best Case O(1) vs Worst Case O(n) in Linear Search
  // Best Case: Target is the very first element -> O(1)
  // Worst Case: Target is the last element or missing -> O(n)
  final String targetLast = 'Notification #99999';
  int steps = 0;
  bool found = false;

  for (final item in notifications) {
    steps++;
    if (item == targetLast) {
      found = true;
      break;
    }
  }
  print(
    'O(n) Linear Search (Worst Case): Found = $found in $steps steps out of ${notifications.length}',
  );

  // 2. Filtering a list (.where / ListView search filter) -> O(n)
  final List<int> prices = [10, 45, 120, 200, 5, 80, 300];
  final List<int> expensivePrices = prices.where((p) => p > 50).toList();
  print('O(n) List Filtering: $expensivePrices');

  // 3. Calculating sum of items -> O(n)
  final double total = prices.fold(0.0, (sum, price) => sum + price);
  print('O(n) Sum Accumulation: \$${total.toStringAsFixed(2)}');
}
