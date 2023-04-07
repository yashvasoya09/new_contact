import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_contact/home/contact%20model.dart';

import 'add screen.dart';

int? Index;

List<ContactModel> contactList = [
  ContactModel(
      name: "Mukesh Ambani",
      mobile: "9988776655",
      image: "assets/images/ambani.jpg"),
  ContactModel(
      name: "Gautam Adani",
      mobile: "9977886655",
      image: "assets/images/adani.jpg"),
  ContactModel(
      name: "ratan tata",
      mobile: "9856460656",
      image: "assets/images/tata.jpg"),
  ContactModel(
      name: "MS dhoni", mobile: "9988557744", image: "assets/images/dhoni.jpg"),
  ContactModel(
      name: "Akshay Kumar",
      mobile: "9852524652",
      image: "assets/images/AkshayKumar.jpg"),
  ContactModel(
      name: "Jeff Bezos",
      mobile: "1188776655",
      image: "assets/images/jeffbezos.jpg"),
  ContactModel(
      name: "Bill Gates",
      mobile: "1122334455",
      image: "assets/images/billgates.jpg"),
  ContactModel(
      name: "Warren Buffett",
      mobile: "1231234545",
      image: "assets/images/warrenbuffett.jpg"),
];

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          backgroundColor: Colors.blue.shade50,
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Recents",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.edit_square, color: Colors.blue, size: 25),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: contactList.length,
                    itemBuilder: (context, index) {
                      return contactlist(
                      contactList[index],
                        index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'addScreen').then((value) {
                setState(() {});
              });
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget contactlist(ContactModel c,int index) {
    return ListTile(
      leading: c.image == null
          ? CircleAvatar(backgroundImage: FileImage(File("$path")), radius: 25)
          : CircleAvatar(backgroundImage: AssetImage("${c.image}"), radius: 25),
      title: Text("${c.name}"),
      subtitle: Text("${c.mobile}"),
      trailing: Text("10:10"),
      onTap: () {
        Navigator.pushNamed(context, 'editScreen', arguments: index);

      },
    );
  }
}
