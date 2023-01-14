


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/pages/ClientClass.dart';
import 'package:sharek_application/pages/ViewDatabase.dart';

import 'ViewModificationpage.dart';

class Admin_interface extends StatefulWidget {
  const Admin_interface({Key? key}) : super(key: key);


  @override
  State<Admin_interface> createState() => _Admin_interfaceState();


}

class _Admin_interfaceState extends State<Admin_interface> {

  static Client c1 = new Client(email: "", password: "", phone: "", Tripid: "");

  static void initialize_database()
  {
    for (int i = 0; i < 100; i++) {
      c1.createClient(email: "test$i", password: "pass$i", phone: "0788$i", tripid: "$i");
    }
    print('Inserted 100 records into the client table');

  }
  static void reset_database()
  {
    print("Reset data base pressed");
    FirebaseFirestore.instance
        .collection('Clinet')
        .where('tripid', isNotEqualTo: 'admin')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        document.reference.delete();
      });
    });

  }

  static void Modify_database()
  {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Interface"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.admin_panel_settings,
            size: 100,
          ),
          Text("Hello admin",style: TextStyle(
            fontSize: 24,
          ),
          ),
          // initialize database
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap:(){
                initialize_database();
              },
              child: Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    color:Colors.red[500],
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text("Initialize database",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  ),
                ),
              ),
            ),
          ),
          //reset database
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap:(){
                reset_database();
              },
              child: Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    color:Colors.red[500],
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text("Reset DataBase",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  ),
                ),
              ),
            ),
          ),
          //View Database
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>ViewDatabsePage())
                );
              },
              child: Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    color:Colors.red[500],
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text("View Database",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  ),
                ),
              ),
            ),
          ),
          //Modify Database
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>ViewModificationPage())
                );

              },
              child: Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    color:Colors.red[500],
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text("Modify Database",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
