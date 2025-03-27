class Point {
  late int x;
  late int y;

  Point() {
    this.x = 0;
    this.y = 0;
  }

  Point.createInstance(int x, int y) {
    this.x = x;
    this.y = y;
  }
}


void main(List<String> args) {
  Point a, b;

  a = Point();
  print('Titik a terletak di koordinat (${a.x}, ${a.y})');

  b = Point.createInstance(2, 3);
  print('Titik b terletak di koordinat (${b.x}, ${b.y})');
}
