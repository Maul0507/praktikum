class Point {
  int _x;
  int _y;

  static int counter = 0;

  Point()
      : _x = 0,
        _y = 0 {
    counter++;
  }

  Point.createInstance(int x, int y)
      : _x = x,
        _y = y {
    counter++;
  }

  void setLocation(int x, int y) {
    _x = x;
    _y = y;
  }

  set x(int value) => _x = value;
  set y(int value) => _y = value;

  int get x => _x;
  int get y => _y;
}

void main(List<String> args) {
  Point a, b, c;

  a = Point();
  print('Pada saat a dibuat, counter bernilai ${Point.counter}');

  b = Point();
  print('Pada saat b dibuat, counter bernilai ${Point.counter}');

  c = Point.createInstance(2, 3);
  print('Pada saat c dibuat, counter bernilai ${Point.counter}');
}
