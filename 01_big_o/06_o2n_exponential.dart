/// Big O(2^n) Exponential Time vs Big O(n) Memoization (Dynamic Programming)
///
/// TIME COMPLEXITY:
/// - Naive Recursion: O(2^n) Time (2,692,537 calls for N=30)
/// - Memoization DP: O(n) Time (59 calls for N=30)
///
/// SPACE COMPLEXITY (MEMORY):
/// - Naive Recursion: O(n) Call Stack Space (stack depth of N frames)
/// - Memoization DP: O(n) Call Stack + O(n) Memo Map Heap Space
library;

void main() {
  final int n = 30;

  print(
      '=== 1. THE BAD WAY: Naive Recursive Fibonacci O(2^n) Time / O(n) Stack Space ===');
  int naiveCalls = 0;

  int fibonacciNaive(int num) {
    naiveCalls++;
    if (num <= 1) return num;
    return fibonacciNaive(num - 1) + fibonacciNaive(num - 2);
  }

  final int naiveResult = fibonacciNaive(n);
  print('Naive Fibonacci($n) = $naiveResult');
  print('• Time  : $naiveCalls recursive function calls O(2^n) 🐢');
  print('• Space : O(n) Call Stack Memory depth ($n frames) 💾');

  print(
      '\n=== 2. THE GOOD WAY: Memoized Fibonacci O(n) Time / O(n) Heap Space ===');
  int memoCalls = 0;
  final Map<int, int> memo = {};

  int fibonacciMemo(int num) {
    memoCalls++;
    if (num <= 1) return num;
    if (memo.containsKey(num)) return memo[num]!;
    memo[num] = fibonacciMemo(num - 1) + fibonacciMemo(num - 2);
    return memo[num]!;
  }

  final int memoResult = fibonacciMemo(n);
  print('Memoized Fibonacci($n) = $memoResult');
  print('• Time  : $memoCalls function calls O(n) ⚡');
  print('• Space : O(n) Memo Map Heap Entries + O(n) Call Stack Depth 💾');

  print('\n=== 📊 THE TIME & SPACE COMPARISON ===');
  print(
      '• Time Advantage : Memoization is ${naiveCalls ~/ memoCalls}x Faster! ⚡');
  print(
      '• Space Tradeoff : Allocated a small O(n) Memo Map to eliminate 2.6M redundant calls! 💾');
}
