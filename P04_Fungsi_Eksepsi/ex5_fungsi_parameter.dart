void fungsiNoParam() {
    for (int i = 0; i < 3; i++) {
        print('${i + 1}. Dart');
    }
}

void fungsiWithParam(String s, int n) {
    for (int i = 0; i < n; i++) {
        print('${i + 1}. $s');
    }
}

void main(List<String> args) {
    fungsiNoParam();
    String str = 'Rekayasa Perangkat Lunak';
    int jml = 5;
    fungsiWithParam(str, jml);
}
