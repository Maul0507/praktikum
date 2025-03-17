double calc(double a, double b, Function operation) {
    return operation(a, b);
}

double add(double a, double b) => a + b;
double multiply(double a, double b) => a * b;
double div(double a, double b) => a / b;

void main(List<String> args) {
    print('12.0 + 3.0 = ${calc(12.0, 3.0, add)}');
    print('12.0 * 3.0 = ${calc(12.0, 3.0, multiply)}');
    print('12.0 / 3.0 = ${calc(12.0, 3.0, div)}');
}
