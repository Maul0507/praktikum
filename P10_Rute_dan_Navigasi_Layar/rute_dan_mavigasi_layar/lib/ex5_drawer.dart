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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/product': (context) => const Product(),
        '/profil': (context) => const Profil(),
      },
    );
  }
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1485290334039-a3c69043e517?ixlib=rb-4.0.3&ixid=M3wyMDg5NzZ8MHwxfHNlYXJjaHwxfHxwcm9maWxlfGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ),
          ),
          accountName: Text(
            'Jane Doe',
            style: TextStyle(fontSize: 24.0),
          ),
          accountEmail: Text('jane.doe@example.com'),
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
        ),
        ListTile(
          title: const Text('Home'),
          leading: const Icon(Icons.home),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Product'),
          leading: const Icon(Icons.add_shopping_cart),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/product');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Profil'),
          leading: const Icon(Icons.person),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/profil');
          },
        ),
      ],
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Halaman Home'),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Product'),
      ),
      body: const Center(
        child: Text('Halaman Product'),
      ),
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Profil'),
      ),
      body: const Center(
        child: Text('Halaman Profil'),
      ),
    );
  }
}
