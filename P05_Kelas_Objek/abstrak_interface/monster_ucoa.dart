import 'monster_ubur_ubur.dart';
import 'flying_monster.dart';

class MonsterUcoa extends MonsterUburUbur
    implements FlyingMonster, FlyingInTheSky {

  @override
  int height = 2000;

  @override
  String fly() {
    return 'Terbang-terbang melayang';
  }
}

abstract class FlyingInTheSky {
  int height = 10000;
}
