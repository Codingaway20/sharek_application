import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Signed in as : ' + user.email!, style: TextStyle(fontSize: 24),),
              MaterialButton(onPressed:(){
                FirebaseAuth.instance.signOut();
              },
                color: Colors.deepOrange,
                child: Text("Sign out"),
              ),
            ],
          )),
    );
  }
}
