import 'package:demo_firebase/data/read.dart';
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
      appBar: AppBar(
        title: Text('Add Data'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter Data ',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    adddata(name);
                  },
                  child: Text('Add data')),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReadData()));
              },
              child: Text('show data'))
        ],
      ),
    );
  }
}
