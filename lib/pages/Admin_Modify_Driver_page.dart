
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ViewModificationpage.dart';

class AdminModifyDriverpage extends StatefulWidget {
  const AdminModifyDriverpage({Key? key}) : super(key: key);

  @override
  State<AdminModifyDriverpage> createState() => _AdminModifyDriverpageState();
}

class _AdminModifyDriverpageState extends State<AdminModifyDriverpage> {
  final _emailController = TextEditingController();
  final _PlateNumberController = TextEditingController();


  Future<void> updateDocumentField(String field, String value, String updateField, String newValue) async {
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection('Driver');

    await collectionRef.where(field, isEqualTo: value)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.length > 0) {
        final DocumentReference docRef = querySnapshot.docs[0].reference;
        docRef.update({updateField: newValue});
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modify Driver Page"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Enter the Driver email and Plate Number Below",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_taxi,
                size: 50,
              ),
              SizedBox(width: 20,),
              Icon(
                Icons.settings,
                size: 50,
              ),
            ],
          ),

          //
          //Email of Driver to Be Deleted
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration:BoxDecoration(
                color: Colors.white38,
                border:Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(12),
              ) ,
              child:Padding(
                padding: EdgeInsets.only(left:20.0),
                child: TextField(
                  controller: _emailController ,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email of Driver",

                  ),
                ),
              ),
            ),
          ),

          //PlateNumber
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration:BoxDecoration(
                color: Colors.white38,
                border:Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(12),
              ) ,
              child:Padding(
                padding: EdgeInsets.only(left:20.0),
                child: TextField(
                  controller: _PlateNumberController ,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: " Enter Plate Number",

                  ),
                ),
              ),
            ),
          ),

          //Confirm Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap:(){
                updateDocumentField("email", _emailController.text.trim(), "plateNum", _PlateNumberController.text.trim());
                //Check Before Moving if the operation is susccssful
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>ViewModificationPage())
                );
              },
              child: Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                    color:Colors.red,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text("Confirm",style: TextStyle(
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
