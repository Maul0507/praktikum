// Perintah break
import 'dart:io';

void main(List<String> args) {
  for (int i = 0; i < 10; i++) {
    stdout.write('$i ');
    if (i == 3) {
      break;
    }
  }
}
