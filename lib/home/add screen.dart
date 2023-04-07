import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_contact/home/contact%20model.dart';
import 'homeScreen.dart';

String? path;

class addScreen extends StatefulWidget {
  const addScreen({Key? key}) : super(key: key);

  @override
  State<addScreen> createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtmobile = TextEditingController();
  ContactModel cm = ContactModel();

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADD Contact"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                path == null
                    ? CircleAvatar(
                        child: Icon(Icons.person, size: 100),
                        radius: 100,
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(File("$path")),
                        radius: 100,
                      ),
                SizedBox(height: 10),
                TextField(
                  controller: txtname,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtmobile,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Mobile No.",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                  ),
                ),
                SizedBox(height: 10),
                IconButton(
                  onPressed: () async {
                    XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      path = image!.path;
                    });
                  },
                  icon: Icon(Icons.photo),
                ),
                IconButton(
                    onPressed: () async {
                      XFile? image =
                          await _picker.pickImage(source: ImageSource.camera);
                      setState(() {
                        path = image!.path;
                      });
                    },
                    icon: Icon(Icons.camera_alt)),
                ElevatedButton(
                  onPressed: () {
                    String name = txtname.text;
                    String mobile = txtmobile.text;
                    ContactModel cm = ContactModel(name: name, mobile: mobile);

                    contactList.add(cm);

                    Navigator.pop(context);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
