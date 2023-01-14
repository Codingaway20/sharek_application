import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/pages/TripClass.dart';
import 'package:sharek_application/pages/home_page.dart';
import 'package:sharek_application/pages/list_drivers.dart';
import 'package:sharek_application/pages/share_drive.dart';

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {

  final _DriverNameController = TextEditingController();
  final _TripDistController = TextEditingController();
  final _TripSourceController = TextEditingController();
  final _TripTimeController = TextEditingController();

  Trip t1 = new Trip(DriverName: ListDrivers.requestedName, tripDistination: "", tripSource: "", tripTime: "");


  static bool isEmpty(String name , String source , String Dist , String time)
  {
    if( (name.isEmpty) || (source.isEmpty) || (Dist.isEmpty) || (time.isEmpty))
      {
        return true;
      }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trips"),
        backgroundColor: Colors.orange,

      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //MainIcon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.join_inner,
                  size: 100,
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text("Please Insert Trip Data Here" ,style: TextStyle(fontSize: 30),),

            SizedBox(height: 25,),
            //Driver name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.white38,
                  border:Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ) ,
                child:Padding(
                  padding: EdgeInsets.only(left:20.0),
                  child: TextField(
                    controller: _DriverNameController ,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Driver Name",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            //Distination
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.white38,
                  border:Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ) ,
                child:Padding(
                  padding: EdgeInsets.only(left:20.0),
                  child: TextField(
                    controller: _TripSourceController ,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Departure",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            //Distination
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.white38,
                  border:Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ) ,
                child:Padding(
                  padding: EdgeInsets.only(left:20.0),
                  child: TextField(
                    controller: _TripDistController ,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Destination",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            //Time
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.white38,
                  border:Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ) ,
                child:Padding(
                  padding: EdgeInsets.only(left:20.0),
                  child: TextField(
                    controller: _TripTimeController ,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Time {dd-hh-mm}",
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(200, 40),
                ),
                onPressed: (){
                  //Adding the trip
                  bool result = _TripsState.isEmpty(_DriverNameController.text.trim(), _TripSourceController.text.trim(), _TripDistController.text.trim(), _TripTimeController.text.trim());
                  if(result==false)
                  {
                    t1.createTrip(DriverName: _DriverNameController.text.trim(), tripSource: _TripSourceController.text.trim(), tripDistination: _TripDistController.text.trim(), tripTime: _TripTimeController.text.trim());
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> Homepage())
                    );
                  }

                }, child: Text("Add trip" ,style: TextStyle(fontWeight: FontWeight.bold),)),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,

                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> ShareDrive())
                  );
                }, child: Text("See available trips" ,style: TextStyle(fontWeight: FontWeight.bold),)),

          ],
        ),
      ),
    );
  }
}
