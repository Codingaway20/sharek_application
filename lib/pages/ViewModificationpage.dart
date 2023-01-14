
import 'package:flutter/material.dart';

import 'Admin_Modify_Client_page.dart';
import 'Admin_Modify_Driver_page.dart';
import 'Admin_Modify_Trip_page.dart';

class ViewModificationPage extends StatefulWidget {
  const ViewModificationPage({Key? key}) : super(key: key);

  @override
  State<ViewModificationPage> createState() => _ViewModificationPageState();
}

class _ViewModificationPageState extends State<ViewModificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Datbase Modification  Choices"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.settings,
              size: 100,
            ),

            //Modify Drivers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>AdminModifyDriverpage())
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                      color:Colors.red[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text("Modify Drivers",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    ),
                  ),
                ),
              ),
            ),

            //Modify Clients
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>AdminModifyClientpage())
                  );

                },
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                      color:Colors.red[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text("Modify Clients",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    ),
                  ),
                ),
              ),
            ),

            //Modify Trips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>AdminModifyTripspage())
                  );


                },
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                      color:Colors.red[500],
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text("Modify Trips",style: TextStyle(
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
