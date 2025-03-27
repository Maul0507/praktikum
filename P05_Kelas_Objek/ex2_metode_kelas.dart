class Point {
  int ? x;
  int ? y;


  void setLocation(int xValue, int yValue) {
    x = xValue;
    y = yValue;
  }
}

void main(List<String> args) {
  var a = Point(); // langsung inisialisasi
  a.setLocation(2, 3);
  print('Titik a terletak di koordinat (${a.x}, ${a.y})');
}
