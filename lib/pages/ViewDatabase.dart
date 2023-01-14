

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/pages/Admin_view_Clients.dart';
import 'package:sharek_application/pages/Admin_view_Drivers.dart';

import 'Admin_view_Trips.dart';

class ViewDatabsePage extends StatefulWidget {
  const ViewDatabsePage({Key? key}) : super(key: key);

  @override
  State<ViewDatabsePage> createState() => _ViewDatabsePageState();
}

class _ViewDatabsePageState extends State<ViewDatabsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin View Data Base Choices"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //ViewDrivers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Admin_view_Drivers())
                  );

                },
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                      color:Colors.red[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text("View Drivers",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    ),
                  ),
                ),
              ),
            ),

            //View Clients
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Admin_view_Clients())
                  );

                },
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                      color:Colors.red[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text("View Clients",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    ),
                  ),
                ),
              ),
            ),

            //View Trips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>AdminViewTrips())
                  );

                },
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                      color:Colors.red[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text("View Trips",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
