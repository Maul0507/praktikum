void main(List<String> args) {
    var fungsiLambda = () {
        print('Demo fungsi tanpa nama (anonymous function)');
    };
    fungsiLambda();
    
    var add = (double a, double b) {
        return a + b;
    };

    var result = add(34, 18);
    print('Nilai variabel result: $result');
}
