import 'dart:io';

void main(List<String> args) {
    int a, b, c;
    stdout.write('Masukkan nilai a: ');
    a = int.parse(stdin.readLineSync()!);
    stdout.write('Masukkan nilai b: ');
    b = int.parse(stdin.readLineSync()!);
    try {
        c = a ~/ b;
        print('$a ~/ $b = $c');
    } on IntegerDivisionByZeroException catch (exception, stackTrace) {
        print('SALAH: terjadi pembagian dengan nilai nol.');
        print('Jenis eksepsi: $exception');
        print('Stacktrace: $stackTrace');
    }
}
