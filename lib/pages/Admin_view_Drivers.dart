
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/pages/share_drive.dart';
import 'DriverClass.dart';
import 'home_page.dart';



class Admin_view_Drivers extends StatefulWidget {
  static String requestedName = "";
  const Admin_view_Drivers({Key? key}) : super(key: key);

  @override
  State<Admin_view_Drivers> createState() => _Admin_view_DriversState();
}

class _Admin_view_DriversState extends State<Admin_view_Drivers> with SingleTickerProviderStateMixin {

  TabController ?controller;

  static String getUntilAt(String s1)
  {
    return (s1.split('@'))[0];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drivers List from Data Base"),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder<List<Driver>>(
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

Stream<List<Driver>> readUsers()=> FirebaseFirestore.instance
    .collection("Driver")
    .snapshots()
    .map((snapshot)=>
    snapshot.docs.map((doc)=> Driver.fromJson(doc.data())).toList());



_makingPhoneCall(String num) async {
  var url = Uri.parse(num);
  if (await UrlLauncher.canLaunchUrl(url)) {
    await UrlLauncher.launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}




Widget buildUser(Driver user) => ListTile(
  leading: CircleAvatar(
    radius: 40.0,
    backgroundImage:  NetworkImage("https://momo-uk.co.uk/image/cache/catalog/Products/Momo/Racing/Steering%20Wheels/MOD.08/Black%20Suede%20Black%20Spokes/MOMO%20racing%20dished%20steering%20wheel%20Model%2008%20black%20suede%20(1)-800x800.jpg"),
  ),
  title: Text(_Admin_view_DriversState.getUntilAt(user.email!),style: TextStyle(fontSize: 25),),
  subtitle: Text(user.phone! , style: TextStyle(fontSize:20 ),),
  onTap: (){
    print("Driver ${_Admin_view_DriversState.getUntilAt(user.email!)}  chossen");
  },
);



