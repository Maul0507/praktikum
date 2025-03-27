class Mahasiswa {
  String name;
  Function(String name) doingHobby;
  Mahasiswa(this.name, {required this.doingHobby});
  void takeARest() {
    if (doingHobby != null) {
      doingHobby(name);
    }
  }
}
