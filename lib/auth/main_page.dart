import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/pages/Admin_interface.dart';
import 'package:sharek_application/pages/login_page.dart';

import '../pages/home_page.dart';
import 'auth_page.dart';

class Mainpage extends StatelessWidget{
  Mainpage({Key?key}):super(key:key);




  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
           if(snapshot.hasData){
             return Homepage();
           }
           else{
             return authpage();
           }
        },
      ),
    );
  }

}

