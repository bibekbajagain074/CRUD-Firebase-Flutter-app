import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Insert_data extends StatefulWidget {
  const Insert_data({super.key});

  @override
  State<Insert_data> createState() => _Insert_dataState();
}

class _Insert_dataState extends State<Insert_data> {
  adddata(value) async {
    await FirebaseFirestore.instance
        .collection('students')
        .add({'name': value});
  }

  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            decoration: InputDecoration(hintText: 'Enter Name '),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                adddata(name);
              },
              child: Text('Add data'))
        ],
      ),
    );
  }
}
