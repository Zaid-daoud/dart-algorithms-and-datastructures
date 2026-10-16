/// Big O(2^n) - Exponential Time Complexity
/// Execution time doubles with every single addition to the input size N.
///
/// Example: Naive Recursive Fibonacci algorithm without memoization.
///
/// Optimization: Using Dynamic Programming / Memoization reduces O(2^n) to O(n)!
library;

void main() {
  int recursiveCalls = 0;

  // Naive Recursive Fibonacci -> O(2^n)
  int fibonacciNaive(int n) {
    recursiveCalls++;
    if (n <= 1) return n;
    return fibonacciNaive(n - 1) + fibonacciNaive(n - 2);
  }

  final int n = 10;
  final int result = fibonacciNaive(n);
  print(
    'O(2^n) Naive Fibonacci($n) = $result ($recursiveCalls recursive calls!)',
  );

  // Optimized Fibonacci using Memoization -> O(n) Time
  int memoCalls = 0;
  final Map<int, int> memo = {};

  int fibonacciMemo(int n) {
    memoCalls++;
    if (n <= 1) return n;
    if (memo.containsKey(n)) return memo[n]!;
    memo[n] = fibonacciMemo(n - 1) + fibonacciMemo(n - 2);
    return memo[n]!;
  }

  final int memoResult = fibonacciMemo(n);
  print(
    'Optimized O(n) Memoized Fibonacci($n) = $memoResult (Only $memoCalls calls!)',
  );
}
