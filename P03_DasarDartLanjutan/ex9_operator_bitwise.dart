// Operator bitwise
void main(List<String> args) {
  int a = 120;
  int b = 127;

  print('Bitwise AND');
  print('$a & $b: ${a & b}');

  print('\nBitwise OR');
  print('$a | $b: ${a | b}');

  print('\nBitwise XOR');
  print('$a ^ $b: ${a ^ b}');

  print('\nBitwise NOT');
  print('~$a: ${~a}');
  print('~$b: ${~b}');

  print('\nBitwise SHIFT LEFT');
  print('$a << 1: ${a << 1}');
  print('$b << 1: ${b << 1}');

  print('\nBitwise SHIFT RIGHT');
  print('$a >> 1: ${a >> 1}');
  print('$b >> 1: ${b >> 1}');
}
