import 'package:hive_flutter/hive_flutter.dart';

class ContactDatabase {

  List contacts= [];

  // reference the box
  final _myBox = Hive.box('myBox');

  void createInitialData() {
    contacts = [["Jane Sample", "CEO", "Company"]];
  }

  // load data from the database
  void loadData(){
    contacts = _myBox.get('CONTACTS');
  }
  // update the database
  void updateDatabase (){
    _myBox.put("CONTACTS", contacts);
  }
}