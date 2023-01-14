
//https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVNSbeB9ClzUno7OQZgtx6aqLmKB1f_kWTq0nbXq5PPg&s
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/pages/TripClass.dart';

import 'list_drivers.dart';


class AdminViewTrips extends StatefulWidget {
  const AdminViewTrips({Key? key}) : super(key: key);

  static BuildContext ?cont;

  @override
  State<AdminViewTrips> createState() => _AdminViewTripsState();
}

class _AdminViewTripsState extends State<AdminViewTrips> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trips List from Data Base"),
        backgroundColor: Colors.red,
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
    backgroundImage: NetworkImage("https://png.pngtree.com/png-clipart/20190628/original/pngtree-vacation-and-travel-icon-png-image_4032146.jpg"),
  ),
  title: Text((trip.tripSource! + "=>"+  trip.tripDistination!),style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold),),
  subtitle: Text(("Driver:" + trip.DriverName! + " Time:" + trip.tripTime!) , style: TextStyle(fontSize:20),),
  onTap: () {

  },
);
