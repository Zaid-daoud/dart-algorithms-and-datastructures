/// Big O(1) - Constant Time & Space Complexity
///
/// TIME COMPLEXITY:
/// - List Loop Search: O(n) Time (up to N steps)
/// - Map Hash Lookup: O(1) Time (1 step)
///
/// SPACE COMPLEXITY (MEMORY):
/// - List Loop: O(1) Extra Space (0 extra memory entries allocated)
/// - Map Lookup: O(n) Space (requires storing N key-value pairs in RAM Heap)
/// -> Classic Time-Space Tradeoff: We spend O(n) Space to gain O(1) Time!
library;

void main() {
  final List<String> userList = List.generate(
    1000000,
    (i) => 'User_$i',
  );

  final Map<String, String> userMap = {
    for (int i = 0; i < 1000000; i++) 'user_$i': 'User_$i',
  };

  final String targetKey = 'user_999999';

  print('=== 1. THE BAD WAY (TIME): List Loop O(n) Time / O(1) Space ===');
  int listSteps = 0;
  String? foundUserList;
  for (final user in userList) {
    listSteps++;
    if (user == 'User_999999') {
      foundUserList = user;
      break;
    }
  }
  print('List Loop: Found = $foundUserList');
  print('• Time  : $listSteps steps O(n) 🐢');
  print('• Space : 0 extra entries allocated O(1) 💾');

  print('\n=== 2. THE GOOD WAY (TIME): Map Lookup O(1) Time / O(n) Space ===');
  final int mapSteps = 1;
  final String? foundUserMap = userMap[targetKey];
  print('Map Lookup: Found = $foundUserMap');
  print('• Time  : $mapSteps step O(1) ⚡');
  print('• Space : 1,000,000 Map entries in RAM Heap O(n) 💾');

  print('\n=== 📊 THE TIME & SPACE TRADEOFF ===');
  print(
      '• Time Advantage  : Map lookup is ${listSteps ~/ mapSteps}x Faster! ⚡');
  print(
      '• Space Tradeoff   : Spent O(n) RAM Memory to achieve O(1) Lookup Time!');
}
