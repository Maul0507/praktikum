// Struktur perulangan menggunakan while
import 'dart:io';

void main(List<String> args) {
  int i;
  i = 0;
  while (i < 5) {
    print('Baris $i');
    i++;
  }

  int n;
  double total = 0.0, data, rata2;

  stdout.write('\nMasukkan jumlah data: ');
  n = int.parse(stdin.readLineSync()!);

  i = 0;
  while (i < n) {
    stdout.write('Data ke-${i + 1}: ');
    data = double.parse(stdin.readLineSync()!);
    total += data;
    i++;
  }

  rata2 = total / n;
  print('\nJumlah \t\t= $total');
  print('Rata-rata \t= $rata2');
}
