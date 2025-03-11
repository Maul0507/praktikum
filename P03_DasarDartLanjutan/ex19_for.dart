// Struktur perulangan menggunakan for
void main(List<String> args) {
  for (int i = 0; i < 5; i++) {
    print('Baris $i');
  }

  List<int> list = [10, 20, 30, 40, 50];
  for (int elemen in list) {
    print(elemen);
  }
}
