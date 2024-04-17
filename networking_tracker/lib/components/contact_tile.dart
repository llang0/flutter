// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String role;
  final String company;
  Function(BuildContext)? deleteFunction;

  ContactTile({
    super.key,
    required this.name,
    this.role = "",
    this.company = "",
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: DefaultTextStyle.merge(
                  style: TextStyle(fontSize: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(role),
                      Text((company != "") ? " at " : ""),
                      Text(company)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
