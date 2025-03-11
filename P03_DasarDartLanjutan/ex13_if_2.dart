// Struktur pemilihan menggunakan if dua kondisi
import 'dart:io';

void main(List<String> args) {
  int a;

  stdout.write('Masukkan bilangan bulat: ');
  a = int.parse(stdin.readLineSync()!);

  if (a > 0) {
    print('$a adalah bilangan bulat positif');
  } else {
    print('$a bukan bilangan bulat positif');
  }
}
