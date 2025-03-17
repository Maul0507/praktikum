import 'dart:math';

double hypotenuse(double a, double b) {
    double square(double val) {
        return val * val;
    }

    return sqrt(square(a) + square(b));
}

void main(List<String> args) {
    print('hypotenuse(3.0, 4.0): ${hypotenuse(3.0, 4.0)}!');
}
