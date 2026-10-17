/// String Concatenation Complexity (+= String Loop O(n^2) vs StringBuffer O(n))
///
/// WHY THIS MATTERS IN DART & FLUTTER:
/// Strings in Dart are immutable.
/// Using string += in a loop creates a NEW String copy of length K on every iteration O(n^2)!
/// Using StringBuffer writes to an internal buffer in O(n) total time.
library;

void main() {
  final List<String> words = List.generate(20000, (i) => 'word_$i ');

  print('=== 1. THE BAD WAY: String += Loop O(n^2) ===');
  // Bad Way: Re-allocates new string memory on every addition -> O(n^2)
  String badResult = '';
  int badAllocatedChars = 0;

  for (final word in words) {
    badAllocatedChars += badResult.length;
    badResult += word;
  }
  print('String += O(n^2): Created string of length ${badResult.length}');
  print('❌ Bad Way Memory Copies: ~$badAllocatedChars character copies! 🐢');

  print('\n=== 2. THE GOOD WAY: StringBuffer O(n) ===');
  // Good Way: Writes to buffer without re-allocating full string copy -> O(n)
  final StringBuffer buffer = StringBuffer();
  for (final word in words) {
    buffer.write(word);
  }
  final String goodResult = buffer.toString();
  print('StringBuffer O(n): Created string of length ${goodResult.length}');
  print('✅ Good Way Operations: ${words.length} buffer writes! ⚡');

  print('\n=== 📊 THE COMPARISON ===');
  print('For 20,000 words:');
  print('• String += O(n^2)      : ~$badAllocatedChars character copies 🐢');
  print('• StringBuffer O(n)    : ${words.length} buffer writes ⚡');
  print(
    '• Performance Gain     : StringBuffer is ~${badAllocatedChars ~/ words.length}x Faster!',
  );
}
