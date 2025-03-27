void main(List<String> args) async {
  var p = Person();
  print('job 1');
  print('job 2');
  p.getData();
  print('job 3 : ' + p.name);
  print('job 4');
  int mode = 2;
  if (mode == 1) {
    await p.getDataAsync();
    print('job 5 : ' + p.name);
    print('job 6');
  } else if (mode == 2) {
    p.getDataAsync().then((_) {
      print('job 5 : ' + p.name);
    });
    print('job 6');
  }
}
class Person {
  String name = 'default name';

  void getData() {
    name = 'Joko';
    print('get data [done]');
  }

  Future<void> getDataAsync() async {
    await Future.delayed(Duration(seconds: 3));
    name = 'Badu';
    print('get data async [done]');
  }
}
