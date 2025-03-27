import 'parameter_diabaikan/igrone_parameter.dart';

void main(List<String> args) {
  var david = Mahasiswa('David', doingHobby: davidsHobby);
  david.takeARest();

  var dewi = Mahasiswa('Dewi', doingHobby: (String name) {
    print('$name is singing');
  });
  dewi.takeARest();

  var anton = Mahasiswa('Anton', doingHobby: (_) {
    print('Swimming in the pool');
  });
  anton.takeARest();
}
void davidsHobby(String name) {
  print('$name is swimming');
}
