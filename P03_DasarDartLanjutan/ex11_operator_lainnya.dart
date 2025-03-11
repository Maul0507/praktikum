// Operator lainnya
void main(List<String> args) {
  print(2 is int);
  print(2 is num);
  print(2 is! String);
  print([1, 2, 3] is! Map); // Menghindari kebingungan

  int a = 9, b = 10; // Gunakan int daripada num jika ingin pakai isOdd dan isEven
  print(a.isOdd);
  print(a.isEven);

  int maks = a > b ? a : b;
  print('Nilai max dari $a dan $b adalah $maks');

  int? aNullable = null; // Gunakan nullable untuk menghindari error
  int c = aNullable ?? b;
  print('Nilai c: $c');
}
