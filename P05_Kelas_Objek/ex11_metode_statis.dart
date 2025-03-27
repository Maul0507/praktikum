class Arithmetic {
  static double add(double a, double b) {
    return a + b;
  }

  static double subtract(double a, double b) {
    return a - b;
  }

  static double mul(double a, double b) {
    return a * b;
  }

  static double div(double a, double b) {
    return a / b;
  }

  static int intDiv(int a, int b) {
    return a ~/ b;
  }

  static int mod(int a, int b) {
    return a % b;
  }
}

void main(List<String> args) {
  print('10.0 + 3.0 = ${Arithmetic.add(10.0, 3.0)}');
  print('10.0 - 3.0 = ${Arithmetic.subtract(10.0, 3.0)}');
  print('10.0 * 3.0 = ${Arithmetic.mul(10.0, 3.0)}');
  print('10.0 / 3.0 = ${Arithmetic.div(10.0, 3.0)}');
  print('10 ~/ 3 = ${Arithmetic.intDiv(10, 3)}');
  print('10 % 3 = ${Arithmetic.mod(10, 3)}');
}
