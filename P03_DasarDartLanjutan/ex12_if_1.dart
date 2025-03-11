// Struktur pemilihan menggunakan if satu kondisi
import 'dart:io';

void main(List<String> args) {
  int a;

  stdout.write('Masukkan bilangan bulat: ');
  a = int.parse(stdin.readLineSync()!);

  if (a > 0) {
    print('$a adalah bilangan bulat positif');
  }
}
