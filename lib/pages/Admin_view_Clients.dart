

import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/pages/share_drive.dart';
import 'package:sharek_application/pages/ClientClass.dart';
import 'home_page.dart';

class Admin_view_Clients extends StatefulWidget {
  static String requestedName = "";
  const Admin_view_Clients({Key? key}) : super(key: key);

  @override
  State<Admin_view_Clients> createState() => _Admin_view_ClientsState();
}

class _Admin_view_ClientsState extends State<Admin_view_Clients> with SingleTickerProviderStateMixin {

  TabController ?controller;

  Future <int> get_num_of_document()async{
    return await FirebaseFirestore.instance.collection('products').snapshots().length;
  }

  static String getUntilAt(String s1)
  {
    return (s1.split('@'))[0];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client List from Data Base"),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder<List<Client>>(
          stream: readUsers(),
          builder:(context ,snapshot){
            if(snapshot.hasError){
              return Text('Something went wrong');
            }
            else if(snapshot.hasData){
              final users = snapshot.data!;
              return ListView(
                children: users.map(buildUser).toList(),
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          } ),
    );
  }
}

Stream<List<Client>> readUsers()=> FirebaseFirestore.instance
    .collection("Clinet")
    .snapshots()
    .map((snapshot)=>
    snapshot.docs.map((doc)=> Client.fromJson(doc.data())).toList());


Widget Admin_Text_Widget()
{
  return Text("Admin Reserved!!" , style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
  ),);
}
Widget Admin_phone_encrpyted()
{
  return Text("**************");
}

NetworkImage Admin_photo()
{
  return NetworkImage("https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg");
}

NetworkImage User_photo()
{
  return NetworkImage("https://cdn-icons-png.flaticon.com/512/6009/6009864.png");
}




Widget buildUser(Client user) => ListTile(
  leading: CircleAvatar(
    radius: 40.0,
    foregroundColor: Colors.red,
    backgroundImage: user.email=="ahmadadmin@gmail.com" ?Admin_photo():User_photo(),
  ),
  title: user.email=="ahmadadmin@gmail.com"?Admin_Text_Widget():Text(_Admin_view_ClientsState.getUntilAt(user.email!),style: TextStyle(fontSize: 25),),
  subtitle:user.email=="ahmadadmin@gmail.com"?Admin_phone_encrpyted():Text(user.phone! , style: TextStyle(fontSize:20 ),),
  onTap: (){
    print("Client ${_Admin_view_ClientsState.getUntilAt(user.email!)} chossen");
  },
);



