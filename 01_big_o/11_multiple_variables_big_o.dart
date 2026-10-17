/// Multiple Variable Big O: O(A + B) vs O(A * B)
///
/// WHY Independent Variables Matter:
/// When an algorithm processes two distinct inputs (e.g. List A of size A, List B of size B),
/// we express complexity in terms of BOTH variables: O(A + B) or O(A * B).
library;

void main() {
  final List<int> listA = List.generate(1000, (i) => i);
  final List<int> listB = List.generate(500, (i) => i);

  print('=== 1. SEQUENTIAL LOOPS: O(A + B) Linear Sum ===');
  int sequentialSteps = 0;

  // First loop over List A
  for (final _ in listA) {
    sequentialSteps++;
  }
  // Second loop over List B
  for (final _ in listB) {
    sequentialSteps++;
  }
  print(
    'Sequential Loops O(A + B): $sequentialSteps steps (${listA.length} + ${listB.length}) ⚡',
  );

  print('\n=== 2. NESTED LOOPS: O(A * B) Product ===');
  int nestedSteps = 0;

  // Outer loop over List A, inner loop over List B
  for (final _ in listA) {
    for (final _ in listB) {
      nestedSteps++;
    }
  }
  print(
    'Nested Loops O(A * B): $nestedSteps steps (${listA.length} * ${listB.length}) 🐢',
  );

  print('\n=== 📊 THE COMPARISON ===');
  print('• O(A + B) Sequential : $sequentialSteps steps ⚡');
  print('• O(A * B) Nested     : $nestedSteps steps 🐢');
  print(
    '• Difference           : O(A + B) is ${nestedSteps ~/ sequentialSteps}x Faster!',
  );
}
