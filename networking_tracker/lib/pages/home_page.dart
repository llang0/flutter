import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:networking_tracker/components/contact_tile.dart';
import 'package:networking_tracker/components/dialog_box.dart';
import 'package:networking_tracker/data/database.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('myBox');

  @override
  void initState(){
    // if this is the first time ever opening app create default data
    if (_myBox.get("CONTACTS") == null){
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  // controllers
  final _nameController = TextEditingController();
  final _roleController = TextEditingController();
  final _companyController = TextEditingController();

  // contacts
  ContactDatabase db = ContactDatabase();

  // new Contact
  void createNewContact() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          nameController: _nameController,
          roleController: _roleController,
          companyController: _companyController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete Contact
  void deleteContact(int index) {
    setState(() {
      db.contacts.removeAt(index);
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.contacts.add([_nameController.text, _roleController.text, _companyController.text]);
      _nameController.clear();
      _roleController.clear();
      _companyController.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      appBar: AppBar(
        title: Text('Networking Tracker', style: TextStyle(color: Colors.black),),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewContact,
        child: Icon(Icons.add, color: Colors.black,),
      ),
      body: ListView.builder(
        itemCount: db.contacts.length,
        itemBuilder: (context, index) {
          return ContactTile(
            name: db.contacts[index][0],
            role: db.contacts[index][1],
            company: db.contacts[index][2],
            deleteFunction: (context) => deleteContact(index),
          );
        },
      ),
    );
  }
}
