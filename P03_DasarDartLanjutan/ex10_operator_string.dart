// Operator String
String reverseString(String s) {
  String result = '';
  for (int i = s.length - 1; i >= 0; i--) {
    result += s[i];
  }
  return result;
}

void main(List<String> args) {
  String s = 'Rekayasa Perangkat Lunak';
  print(s);
  print(reverseString(s));
}
