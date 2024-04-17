// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:networking_tracker/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final nameController;
  final roleController;
  final companyController;
  VoidCallback onSave;
  VoidCallback onCancel;
  // VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.nameController,
    required this.roleController,
    required this.companyController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    const double spacerSize = 24;
    return AlertDialog(
      backgroundColor: Colors.blueGrey[400],
      content: Container(
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                  ),
                ),
                const SizedBox(height: spacerSize,),
                TextField(
                  controller: roleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Role",
                  ),
                ),
                const SizedBox(height: spacerSize,),
                TextField(
                  controller: companyController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Company",
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
