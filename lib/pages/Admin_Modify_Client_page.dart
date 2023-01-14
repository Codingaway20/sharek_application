import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ViewModificationpage.dart';

class AdminModifyClientpage extends StatefulWidget {
  const AdminModifyClientpage({Key? key}) : super(key: key);

  @override
  State<AdminModifyClientpage> createState() => _AdminModifyClientpageState();
}

class _AdminModifyClientpageState extends State<AdminModifyClientpage> {

  final _emailController = TextEditingController();
  final _PhoneNumberController = TextEditingController();


  Future<void> updateDocumentField(String field, String value, String updateField, String newValue) async {
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection('Clinet');

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
        title: Text("Modify Clinet Page"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Enter the Client email and Phone Number Below",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.supervised_user_circle,
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
          //Email of Client to Be Deleted
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
                    hintText: "Email of Client",

                  ),
                ),
              ),
            ),
          ),

          //Phone Number
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
                  controller: _PhoneNumberController ,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: " Enter Phone Number",

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
                updateDocumentField("email", _emailController.text.trim(), "phone", _PhoneNumberController.text.trim());
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
