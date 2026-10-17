/// Asymptotic Notations: Big O (O), Big Omega (Ω), and Big Theta (Θ)
///
/// 1. Big O (O)     : Upper Bound (Worst Case Scenario)
/// 2. Big Omega (Ω) : Lower Bound (Best Case Scenario)
/// 3. Big Theta (Θ) : Tight Bound (Exact / Average Case when Upper & Lower match)
library;

void main() {
  final List<int> numbers = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

  print('=== 1. LINEAR SEARCH: Ω(1) Best Case vs O(n) Worst Case ===');
  // Best Case Ω(1): Target is at index 0 -> 1 step
  // Worst Case O(n): Target is missing or at the end -> N steps
  int stepsToFind(int target) {
    int steps = 0;
    for (final num in numbers) {
      steps++;
      if (num == target) break;
    }
    return steps;
  }

  print('• Best Case Ω(1) Search for 10  : ${stepsToFind(10)} step ⚡');
  print('• Worst Case O(n) Search for 100: ${stepsToFind(100)} steps 🐢');

  print('\n=== 2. SUM CALCULATIONS / MERGE SORT: Θ(n) Tight Bound ===');
  // Calculating the sum of a list ALWAYS visits every element exactly N times.
  // Best Case = N steps, Worst Case = N steps.
  // Because Best Case = Worst Case = N, we say the complexity is Θ(n) Tight Bound!
  int sumSteps = 0;
  int sum = 0;
  for (final num in numbers) {
    sumSteps++;
    sum += num;
  }
  print(
      '• Sum Calculation Θ(n) Tight Bound: $sumSteps steps (Always N steps!) ⚡');
  print('• Sum Result: $sum');
}
