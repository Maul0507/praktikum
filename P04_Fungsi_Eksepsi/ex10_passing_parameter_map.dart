void printMap(Map<String, int> map) {
    map.forEach((key, value) {
        print('$key: $value');
    });
}

void main(List<String> args) {
    Map<String, int> aMap = {'Durian': 24, 'Dendan': 5, 'Manggis': 3};
    print('Elemen-elemen map:');
    printMap(aMap);
}
