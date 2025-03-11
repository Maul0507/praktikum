// Struktur perulangan menggunakan for-each
void main(List<String> args) {
  List<int> list = [10, 20, 30, 40, 50];
  list.forEach((elemen) {
    print(elemen);
  });

  Map<String, String> map = {
    'one': 'satu',
    'two': 'dua',
    'three': 'tiga',
    'four': 'empat',
    'five': 'lima'
  };

  map.forEach((key, value) {
    print("'$key' artinya '$value'");
  });
}
