import 'dart:io';

class NegativeError implements Exception {
  String? message;
  NegativeError([this.message]);
}

void main(List<String> args) {
  int a;
  try {
    stdout.write('Masukkan bilangan non-negatif: ');
    a = int.parse(stdin.readLineSync()!);
    if (a < 0) {
      throw NegativeError();
    }
    print('Anda memasukkan nilai $a.');
  } on FormatException catch (exception, stackTrace) {
    print('SALAH: nilai yang dimasukkan bukan bilangan.');
    print('Jenis eksepsi: $exception');
    print('Stacktrace: $stackTrace');
  } on NegativeError catch (exception, stackTrace) {
    print('SALAH: anda memasukkan nilai negatif.');
    print('Jenis eksepsi: $exception');
    print('Stacktrace: $stackTrace');
  } catch (exception, stackTrace) {
    print('SALAH: terjadi eksepsi bertipe $exception.');
    print('Stacktrace: $stackTrace');
  }
}
