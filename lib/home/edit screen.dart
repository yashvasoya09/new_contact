import 'package:flutter/material.dart';
import 'package:new_contact/home/homeScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact model.dart';
class editScreen extends StatefulWidget {
  const editScreen({Key? key}) : super(key: key);

  @override
  State<editScreen> createState() => _editScreenState();
}

class _editScreenState extends State<editScreen> {
  @override

  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                        Icon(Icons.chevron_left, size: 30, color: Colors.blue),
                  ),
                  SizedBox(width: 7),
                  Text(
                    "Contacts",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.blue,
                  )
                ],
              ),
              SizedBox(height: 10),
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 100),
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                            radius: 100, backgroundImage: AssetImage("${contactList[index].image}")),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 210),
                      Center(
                        child: Text(
                          "${contactList[index].name}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 235),
                      Center(
                        child: Text(
                          "${contactList[index].mobile}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 150),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(height: 50,width: 50,color: Colors.blue.shade50,child: IconButton(onPressed: (){
                              String link = "sms:${contactList[index].mobile}?body=hello!!!!";
                              launchUrl(Uri.parse(link));
                            }, icon:Icon(Icons.message))),
                            Container(height: 50,width: 50,color: Colors.blue.shade50,child: IconButton(onPressed: (){
                              String link = "tel:${contactList[index].mobile} ";
                              launchUrl(Uri.parse(link));
                            }, icon:Icon(Icons.call))),
                            Container(height: 50,width: 50,color: Colors.blue.shade50,child: IconButton(onPressed: (){}, icon:Icon(Icons.video_call))),
                            Container(height: 50,width: 50,color: Colors.blue.shade50,child: IconButton(onPressed: (){}, icon:Icon(Icons.email))),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
