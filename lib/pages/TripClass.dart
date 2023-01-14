import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trip {
  String ?tripId;
  String ?DriverName;
  String ?tripDistination;
  String ?tripSource;
  String ?tripTime;


  Trip({
    this.tripId = '',
    required this.DriverName,
    required this.tripDistination,
    required this.tripSource,
    required this.tripTime,
  });

  Map<String , dynamic> toTrip()=>{
    'tripId' : tripId,
    'DriverName' : DriverName,
    'tripSource': tripSource,
    'tripDistination'  : tripDistination,
    'tripTime': tripTime,
  };

  static Trip fromJson(Map<String ,dynamic> json) => Trip(
    tripId: json['tripId'],
    DriverName: json['DriverName'],
    tripSource: json['tripSource'],
    tripDistination: json['tripDistination'],
    tripTime: json['tripTime'],

  );



  Future createTrip ({String? tripId , required String DriverName , required String tripSource , required String tripDistination , required String tripTime}) async{

    final docTrip = FirebaseFirestore.instance.collection('Trip').doc();

    final Trip1 = Trip(
        tripId: docTrip.id,
        DriverName: DriverName,
        tripSource: tripSource,
        tripDistination: tripDistination,
        tripTime: tripTime,
    );

    final trip = Trip1.toTrip();

    //create document
    await docTrip.set(trip);

  }

}