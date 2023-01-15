
//https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVNSbeB9ClzUno7OQZgtx6aqLmKB1f_kWTq0nbXq5PPg&s
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/pages/TripClass.dart';

import 'list_drivers.dart';


class ShareDrive extends StatefulWidget {
  const ShareDrive({Key? key}) : super(key: key);

  static BuildContext ?cont;

  @override
  State<ShareDrive> createState() => _ShareDriveState();
}

class _ShareDriveState extends State<ShareDrive> {

  @override
  Widget build(BuildContext context) {
    ShareDrive.cont = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(" Trips List"),
        backgroundColor: Colors.orange,
      ),
      body: StreamBuilder<List<Trip>>(
          stream: readTrips(),
          builder:(context ,snapshot){
            if(snapshot.hasError){
              return Text('Something went wrong');
            }
            else if(snapshot.hasData){
              final trips = snapshot.data!;
              return ListView(
                children: trips.map(buildTrip).toList(),
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          } ),
    );
  }
}

Stream<List<Trip>> readTrips()=> FirebaseFirestore.instance
    .collection("Trip")
    .snapshots()
    .map((snapshot)=>
        snapshot.docs.map((doc)=> Trip.fromJson(doc.data())).toList());


Widget buildTrip(Trip trip) => ListTile(
  //CircleAvatar(child: Text('${user.id}')),
  leading: CircleAvatar(
    radius: 40.0,
    backgroundColor: Colors.orange,
    foregroundColor: Colors.orange,
    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVNSbeB9ClzUno7OQZgtx6aqLmKB1f_kWTq0nbXq5PPg&s"),
  ),
  title: Text((trip.tripSource! + "=>"+  trip.tripDistination!),style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold),),
  subtitle: Text(("Driver:" + trip.DriverName! + " Time:" + trip.tripTime!) , style: TextStyle(fontSize:20),),
  onTap: () {
    // Navigate to the second screen
    Navigator.of(ShareDrive.cont!).push(
      MaterialPageRoute(
        builder: (context) => ListDrivers(),
      ),
    );
  },
);
