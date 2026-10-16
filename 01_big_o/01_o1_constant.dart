/// Big O(1) - Constant Time Complexity
/// Operations execute in the exact same amount of time, regardless of input size (N).
///
/// Includes:
/// - List index access: list[i]
/// - Map hash key lookup: map[key]
/// - Property checks: .length, .isEmpty
/// - Amortized O(1) Time: List.add() (O(1) average, occasional O(N) allocation when capacity doubles)
library;

void main() {
  final List<String> products = List.generate(1000000, (i) => 'Product_$i');
  final Map<String, String> userCache = {
    for (int i = 0; i < 1000000; i++) 'user_$i': 'User Name $i',
  };

  // 1. Direct Index Access in List -> O(1)
  final String productAtCenter = products[500000];
  print('O(1) List Index Access: $productAtCenter');

  // 2. Map Key Lookup (Hash Map) -> O(1)
  final String? cachedUser = userCache['user_500000'];
  print('O(1) Map Hash Lookup: $cachedUser');

  // 3. Getting List Length or Checking Empty -> O(1)
  print('O(1) Length Check: ${products.length}');
  print('O(1) Is Empty Check: ${products.isEmpty}');

  // 4. Amortized O(1) - Adding elements to a dynamic List
  // Inserting into a list is usually O(1), but when the underlying array fills up,
  // Dart reallocates memory (O(N)). Averaged over many inserts, it is Amortized O(1).
  final List<int> dynamicList = [];
  for (int i = 0; i < 10; i++) {
    dynamicList.add(i); // Amortized O(1)
  }
  print('Amortized O(1) List Add: $dynamicList');
}
