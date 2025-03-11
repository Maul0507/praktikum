// Perintah return
double kali(double a, double b) {
    if (a == 0 || b == 0) {
        return 0;
    }
    double c = a * b;
    return c;
}

void main(List<String> args) {
    double hasil = kali(8, 9);
    print(hasil);
}
