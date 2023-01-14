import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ViewModificationpage.dart';

class AdminModifyTripspage extends StatefulWidget {
  const AdminModifyTripspage({Key? key}) : super(key: key);

  @override
  State<AdminModifyTripspage> createState() => _AdminModifyTripspageState();
}

class _AdminModifyTripspageState extends State<AdminModifyTripspage> {

  final _SourceController = TextEditingController();
  final _DistinationController = TextEditingController();

  Future<void> updateDocumentField(String field, String value, String updateField, String newValue) async {
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection('Trip');

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
        title: Text("Modify Trip Page"),
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
                Icons.trip_origin,
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
          //Source
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
                  controller: _SourceController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Departure place ",

                  ),
                ),
              ),
            ),
          ),

          //Distination
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
                  controller: _DistinationController ,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Distination",

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
                updateDocumentField("tripSource", _SourceController.text.trim(), "tripDistination", _DistinationController.text.trim());
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
