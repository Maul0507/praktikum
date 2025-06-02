import 'package:flutter/material.dart';
import 'package:pepek/modul_11/sqllite/helpers/dbhelper.dart';
import 'package:pepek/modul_11/sqllite/models/contact.dart';

import 'package:sqflite/sqflite.dart';
import 'dart:async';

// Pastikan ini ada, atau kamu buat file entry_form.dart
import 'entryform.dart';

class HomeSqllite extends StatefulWidget {
  const HomeSqllite({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeSqllite> {
  int _count = 0;
  List<Contact> contactList = [];

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coba Akses SQLite'),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: "Tambah Contact",
        onPressed: () async {
          var contact = await navigateToEntryForm(context, Contact("", ""));
          if (contact != null) {
            addContact(contact);
          }
        },
      ),
    );
  }

  Future<Contact?> navigateToEntryForm(BuildContext context, Contact contact) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return EntryForm(contact);
        },
      ),
    );
    return result;
  }

  ListView createListView() {
    return ListView.builder(
      itemCount: _count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2.0,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.people),
            ),
            title: Text(contactList[index].name),
            subtitle: Text(contactList[index].phone),
            trailing: GestureDetector(
              child: const Icon(Icons.delete),
              onTap: () {
                deleteContact(contactList[index].id!);
              },
            ),
            onTap: () async {
              var contact = await navigateToEntryForm(context, contactList[index]);
              if (contact != null) {
                editContact(contact);
              }
            },
          ),
        );
      },
    );
  }

  void addContact(Contact contact) async {
    int result = await DbHelper.insertContact(contact);
    if (result > 0) {
      updateListView();
    }
  }

  void editContact(Contact contact) async {
    int result = await DbHelper.updateContact(contact);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteContact(int id) async {
    int result = await DbHelper.delete(id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = DbHelper.db();
    dbFuture.then((database) {
      Future<List<Contact>> contactListFuture = DbHelper.getContactList();
      contactListFuture.then((contactList) {
        setState(() {
          this.contactList = contactList;
          _count = contactList.length;
        });
      });
    });
  }
}
