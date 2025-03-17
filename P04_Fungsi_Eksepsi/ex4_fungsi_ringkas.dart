double div(double a, double b) => a / b;

String concat(String str1, String str2) => str1 + str2;

bool odd(int a) => a.isOdd;

void main(List<String> args) {
    print('div(20.4, 3.5): ${div(20.4, 3.5)}');
    print('concat("Dart ", "Programming Language"): ' + 
          concat("Dart ", "Programming Language"));
    print('odd(9): ${odd(9)}');
}
