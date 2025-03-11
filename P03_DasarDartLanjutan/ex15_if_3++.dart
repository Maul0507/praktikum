// Struktur pemilihan menggunakan if lebih dari tiga kondisi
import 'dart:io';

void main(List<String> args) {
  int no;
  String nama;

  stdout.write('Masukkan nomor bulan: ');
  no = int.parse(stdin.readLineSync()!);

  if (no == 1) {
    nama = 'Januari';
  } else if (no == 2) {
    nama = 'Februari';
  } else if (no == 3) {
    nama = 'Maret';
  } else if (no == 4) {
    nama = 'April';
  } else if (no == 5) {
    nama = 'Mei';
  } else if (no == 6) {
    nama = 'Juni';
  } else if (no == 7) {
    nama = 'Juli';
  } else if (no == 8) {
    nama = 'Agustus';
  } else if (no == 9) {
    nama = 'September';
  } else if (no == 10) {
    nama = 'Oktober';
  } else if (no == 11) {
    nama = 'November';
  } else if (no == 12) {
    nama = 'Desember';
  } else {
    print('Nomor bulan yang dimasukkan salah');
    exit(1);
  }

  print('Nama bulan ke-$no adalah $nama');
}
