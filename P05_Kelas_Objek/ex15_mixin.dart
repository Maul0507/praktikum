import 'abstrak_interface/barbarian.dart' as barb;
import 'abstrak_interface/knight.dart' as knight;

void main(List<String> args) {
  knight.Knight k = knight.Knight();
  print('Knight minum: ${k.drink()}');

  barb.Barbarian b = barb.Barbarian();
  print('Barbarian minum: ${b.drink()}');
}
