import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/auth/auth_page.dart';
import 'package:sharek_application/pages/Admin_interface.dart';
import 'package:sharek_application/pages/Trips.dart';
import 'package:sharek_application/pages/share_drive.dart';

import 'list_drivers.dart';
import 'login_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser!;
  String? name = FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.orange,
        title: const Text(
          "Welcome to home page",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          SizedBox(height: 30,),
          Text("Sharek is where we connect together!" ,textAlign: TextAlign.center,style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),),
          const Icon(
            Icons.taxi_alert_outlined,
            size: 43,
          ),

          SizedBox(height: 50,),

          //List driver row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.list_alt,
                size: 200,
              ),
              SizedBox(width: 66,),

              //List drivers Button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> ListDrivers())
                    );
                  }, child: Text("List Drivers")),
            ],
          ),

          //Two Buttons in a Row
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.share,
                size: 200,
              ),
              SizedBox(width: 66,),

              //Share Drive Button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> ShareDrive())
                    );
                  }, child: Text("Share Drive")),
            ],
          ),


          SizedBox(height: 65,),
          Row(
            //list trips
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,

                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> Trips())
                    );
                  }, child: Text("Add trip +" ,style: TextStyle(fontWeight: FontWeight.bold),)),

              SizedBox(width: 30,),

              MaterialButton(onPressed:(){
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> authpage())
                );
              },
                color: Colors.deepOrange,
                child: Text("Sign out"),
              ),
            ],
          ),
        ],
      ),
    );
  } // menu widget
}
