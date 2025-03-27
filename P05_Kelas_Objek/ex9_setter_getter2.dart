class Point {
  int _x;
  int _y;

  Point()
      : _x = 0,
        _y = 0;

  Point.createInstance(this._x, this._y);

  void setLocation(int xValue, int yValue) {
    _x = xValue;
    _y = yValue;
  }

  set x(int value) => _x = value;
  set y(int value) => _y = value;

  int get x => _x;
  int get y => _y;
}

void main(List<String> args) {
  Point a;
  a = Point();
  a.x = 2;
  a.y = 3;
  print('Titik a terletak di koordinat (${a.x}, ${a.y})');
}
