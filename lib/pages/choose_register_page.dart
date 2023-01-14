import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/auth/auth_page.dart';
import 'package:sharek_application/pages/register_page.dart';

import 'driver_register_page.dart';

class ChooseRegister extends StatefulWidget {

  final VoidCallback showLoginPage;
  const ChooseRegister({
    Key? key,
     required this.showLoginPage
  }) : super(key: key);

  @override
  State<ChooseRegister> createState() => _ChooseRegisterState();

}

class _ChooseRegisterState extends State<ChooseRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.orange,
        title: const Text(
          "Sharek Registration",
        ),
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_box,
                    size: 175,
                  ),
                ],
              ),

            //Register as Driver
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          fixedSize: Size(200, 50)

                      ),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> DriverRegister(showLoginPage: () {  },))
                        );
                      }, child: Text("Register as Driver")),
                ],
              ),
              SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.accessibility_rounded,
                    size: 175,
                  ),
                ],
              ),
              //Register as User
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          fixedSize: Size(200, 50)

                      ),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> Registerpage(showLoginPage: () {  },))
                        );
                      }, child: Text("Register as User")),
                ],
              ),


            SizedBox(height: 70,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,

                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> authpage())
                  );
                }, child: Text("Return to Login page")),

              //not a member ? Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    "Im a member",
                    style:TextStyle(
                      fontWeight:FontWeight.bold,
                    ) ,
                  ),
                  GestureDetector(
                    onTap:widget.showLoginPage,
                    child: Text(
                      "Log in now",
                      style:TextStyle(
                        color: Colors.blue,
                        fontWeight:FontWeight.bold,
                      ) ,
                    ),
                  ),
                ],
              ),

            ],
          ),
        )
        ,

      ),
    );
  }
}
