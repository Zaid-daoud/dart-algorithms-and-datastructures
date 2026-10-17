/// Big O(n) - Linear Time & Space Complexity
///
/// TIME COMPLEXITY:
/// - Best Case Ω(1): Target is the first item (1 step).
/// - Worst Case O(n): Target is the last item or missing (N steps).
///
/// SPACE COMPLEXITY (MEMORY):
/// - In-place fold/sum: O(1) Space (0 new lists created).
/// - Filtering (.where().toList()): O(k) Space (creates a new list of filtered elements in Heap).
library;

void main() {
  final List<String> notifications = List.generate(
    100000,
    (i) => 'Notification #$i',
  );

  print('=== 1. BEST CASE Ω(1) vs WORST CASE O(n) TIME ===');
  // Best Case Ω(1): Target is at index 0
  int bestSteps = 0;
  for (final item in notifications) {
    bestSteps++;
    if (item == 'Notification #0') break;
  }
  print('• Best Case Ω(1) Search : $bestSteps step ⚡');

  // Worst Case O(n): Target is at index N - 1
  int worstSteps = 0;
  for (final item in notifications) {
    worstSteps++;
    if (item == 'Notification #99999') break;
  }
  print('• Worst Case O(n) Search: $worstSteps steps 🐢');

  print('\n=== 2. IN-PLACE O(1) SPACE vs FILTERED COPY O(n) SPACE ===');
  final List<int> prices = [10, 45, 120, 200, 5, 80, 300];

  // In-place fold: O(1) Auxiliary Space
  final double total = prices.fold(0.0, (sum, price) => sum + price);
  print(
      '• Accumulation Fold O(1) Space: \$${total.toStringAsFixed(2)} (0 new lists allocated) 💾');

  // List filtering: O(k) Auxiliary Space where k is matching items
  final List<int> expensivePrices = prices.where((p) => p > 50).toList();
  print(
      '• List Filtering O(k) Space    : $expensivePrices (Allocated ${expensivePrices.length} new items in Heap) 💾');
}
