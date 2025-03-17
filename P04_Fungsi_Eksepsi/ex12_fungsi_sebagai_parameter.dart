double calc(double a, double b, Function operation) {
    return operation(a, b);
}

void main(List<String> args) {
    double add = calc(12.0, 3.0, (a, b) {
        return a + b;
    });

    double multiply = calc(12.0, 3.0, (a, b) {
        return a * b;
    });

    double div = calc(12.0, 3.0, (a, b) {
        return a / b;
    });

    double mod = calc(12.0, 3.0, (a, b) => a % b);

    print('12.0 + 3.0 = $add');
    print('12.0 * 3.0 = $multiply');
    print('12.0 / 3.0 = $div');
    print('12.0 % 3.0 = $mod');
}
