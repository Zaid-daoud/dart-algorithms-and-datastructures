import '01_o1_constant.dart' as o1;
import '02_ologn_logarithmic.dart' as ologn;
import '03_on_linear.dart' as on;
import '04_onlogn_linearithmic.dart' as onlogn;
import '05_on2_quadratic.dart' as on2;
import '06_o2n_exponential.dart' as o2n;
import '07_onfactorial_factorial.dart' as onfactorial;
import '08_space_complexity.dart' as space;
import '09_dart_collections_complexity.dart' as collections;
import '10_string_concatenation_complexity.dart' as string_concat;
import '11_multiple_variables_big_o.dart' as multi_vars;
import '12_big_theta_and_omega.dart' as theta_omega;

void main() {
  print('=== 1. Big O(1) Constant Time ===');
  o1.main();

  print('\n=== 2. Big O(log n) Logarithmic Time ===');
  ologn.main();

  print('\n=== 3. Big O(n) Linear Time ===');
  on.main();

  print('\n=== 4. Big O(n log n) Linearithmic Time ===');
  onlogn.main();

  print('\n=== 5. Big O(n^2) Quadratic Time ===');
  on2.main();

  print('\n=== 6. Big O(2^n) Exponential Time ===');
  o2n.main();

  print('\n=== 7. Big O(n!) Factorial Time ===');
  onfactorial.main();

  print('\n=== 8. Space Complexity ===');
  space.main();

  print('\n=== 9. Dart Collections Complexity ===');
  collections.main();

  print('\n=== 10. String Concatenation Complexity ===');
  string_concat.main();

  print('\n=== 11. Multiple Variable Big O ===');
  multi_vars.main();

  print('\n=== 12. Big Theta (Θ) & Big Omega (Ω) ===');
  theta_omega.main();
}
