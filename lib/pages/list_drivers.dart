
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/pages/share_drive.dart';




import 'DriverClass.dart';
import 'home_page.dart';

class ListDrivers extends StatefulWidget {
  static String requestedName = "";
  const ListDrivers({Key? key}) : super(key: key);

  @override
  State<ListDrivers> createState() => _ListDriversState();
}

class _ListDriversState extends State<ListDrivers> with SingleTickerProviderStateMixin {

  TabController ?controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(length: 3, vsync: this , initialIndex: 0);
  }
  static String getUntilAt(String s1)
  {
    return (s1.split('@'))[0];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drivers List"),
        backgroundColor: Colors.orange,
      ),
      body: StreamBuilder<List<Driver>>(
          stream: readUsers(),
          builder:(context ,snapshot){
            if(snapshot.hasError){
              return Text('Something went wrong');
            }
            else if(snapshot.hasData){
              if(ListDrivers.requestedName == "")
                {
                  final users = snapshot.data!;
                  return ListView(
                    children: users.map(buildUser).toList(),
                  );
                }
              else
                {
                  final users = snapshot.data!;
                  return ListView(
                    children: users.map(buildUser2).toList(),
                  );

                }

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
    backgroundColor: Colors.orange,
    foregroundColor: Colors.orange,
    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVA_HrQLjkHiJ2Ag5RGuwbFeDKRLfldnDasw&usqp=CAU"),
  ),
  title: Text(_ListDriversState.getUntilAt(user.email!),style: TextStyle(fontSize: 25),),
  subtitle: Text(user.plateNum! , style: TextStyle(fontSize:20 ),),
  onTap: (){
    String ?phonenum = "tel:";
    phonenum = phonenum + user.phone!;
    _makingPhoneCall(phonenum);
  },
);



Widget buildUser2(Driver user) => ListTile(

  leading: CircleAvatar(
    radius: 40.0,
    backgroundColor: Colors.red,
    foregroundColor: Colors.red,
    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVA_HrQLjkHiJ2Ag5RGuwbFeDKRLfldnDasw&usqp=CAU"),
  ),
  title: Text(_ListDriversState.getUntilAt(user.email!),style: TextStyle(fontSize: 25),),
  subtitle: Text(user.plateNum! , style: TextStyle(fontSize:20 ),),
  onTap: (){
    String ?phonenum = "tel:";
    phonenum = phonenum + user.phone!;
    _makingPhoneCall(phonenum);
  },
);