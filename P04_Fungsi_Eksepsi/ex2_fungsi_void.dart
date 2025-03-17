import 'dart:math';

void echo(dynamic value) {
  print(value.toString());
}

void main (List<String> args) {
  echo('Program Studi D4 Rekayasa Perangkat Lunak');
  echo(2020);
  echo('2.5');
  echo([1, 2, 3, 4, 5]);
  echo({'satu': 1, 'dua': 2, 'tiga': 3, 'empat': 4, 'lima': 5});
}