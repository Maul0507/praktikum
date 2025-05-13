import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  //step 1 : membuat objek dari class TabController
  @override
  void initState() {
    super.initState();
    //membuat objek dari class TabController
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coba Tab Navigation'),
        elevation: 7.0,
        //step 2 : membuat objek dari class TabBar
        bottom: TabBar(
          tabs: const <Widget>[
            Padding(padding: EdgeInsets.all(10.0), child: Text('Home')),
            Padding(padding: EdgeInsets.all(10.0), child: Text('Product')),
            Padding(padding: EdgeInsets.all(10.0), child: Text('Profile')),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
      ),
      //Step 3 : membuat object dari class TabBarView
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[Home(), Product(), Profil()],
      ),
    );
  }
}

//halaman yang dipanggil dari TabBarView tidak memerlukan scaffold lagi
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Halaman Home'));
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Halaman product'));
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Halaman profile'));
  }
}
