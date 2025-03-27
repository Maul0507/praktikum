class SecureBox<Tipe> {
  final Tipe _data;
  final String _pin;

  SecureBox(this._data, this._pin);

  Tipe? getData(String pin) => (pin == _pin) ? _data : null;
}

class Person {
  final String name;
  Person(this.name);
}

void main(List<String> args) {
  var boxString = SecureBox<String>('Hello', '123');
  print(boxString.getData('321')?.toString());
  print(boxString.getData('123')?.toString());

  var boxInt = SecureBox<int>(1000, '123');
  print(boxInt.getData('123')?.toString());

  var boxDateTime = SecureBox<DateTime>(DateTime.now(), '123');
  print(boxDateTime.getData('123')?.toString());

  var maul = SecureBox<Person>(Person('maul'), '123');
  print(maul.getData('123')?.name);
}
