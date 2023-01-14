import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'DriverClass.dart';

class DriverRegister extends StatefulWidget {

  final VoidCallback showLoginPage;
  const DriverRegister({
    Key? key,
    required this.showLoginPage
  }) : super(key: key);

  @override
  State<DriverRegister> createState() => _DriverRegisterState();
}

class _DriverRegisterState extends State<DriverRegister> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ConfirmpasswordController = TextEditingController();
  final _PhoneController = TextEditingController();
  final _PlateNumberController = TextEditingController();
  final _CarTypeController = TextEditingController();
  Driver d1 = new Driver(email: "", password: "", phone: "", plateNum: "", carType: "");


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _ConfirmpasswordController.dispose();
    _PhoneController.dispose();
    _PlateNumberController.dispose();
    _CarTypeController.dispose();
    super.dispose();
  }

  bool Password_confirmed() {
    if(_passwordController.text.trim() == _ConfirmpasswordController.text.trim()){
      return true;
    }
    return false;

  }
  bool OtherInfoConfirmed()
  {
    return true;
  }

  Future singUp() async{
    if(Password_confirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      d1.createDriver(email: _emailController.text.trim(), password: _passwordController.text.trim(), phone: _PhoneController.text.trim(), plate: _PlateNumberController.text.trim(), CarType: _CarTypeController.text.trim());
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.orange,
          title: const Text(
            "SHAREK",
          ),
        ),
        backgroundColor: Colors.white,
        body:SafeArea(
            child:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.android_outlined,
                    size: 100,

                  ),
                  //Hello driver
                  const Text(
                    "Hello Driver !",
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                  ),
                  const SizedBox(height:10),
                  const Text(
                    "Register below with your details",
                    style:TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                      height: 20),

                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration:BoxDecoration(
                        color: Colors.white38,
                        border:Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ) ,
                      child:Padding(
                        padding: EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _emailController ,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",

                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15,),
                  //password
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration:BoxDecoration(
                        color: Colors.white38,
                        border:Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ) ,
                      child: Padding(
                        padding: EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",

                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),

                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration:BoxDecoration(
                        color: Colors.white38,
                        border:Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ) ,
                      child: Padding(
                        padding: EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _ConfirmpasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm Password",

                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),

                  //Phone
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration:BoxDecoration(
                        color: Colors.white38,
                        border:Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ) ,
                      child:Padding(
                        padding: EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _PhoneController ,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",

                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15,),

                  //Plate number
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration:BoxDecoration(
                        color: Colors.white38,
                        border:Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ) ,
                      child:Padding(
                        padding: EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _PlateNumberController ,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Plate Number",

                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),

                  //Car Type
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration:BoxDecoration(
                        color: Colors.white38,
                        border:Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ) ,
                      child:Padding(
                        padding: EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _CarTypeController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Car Type",

                          ),
                        ),
                      ),
                    ),
                  ),

                  //sign in button
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 100),
                    child: GestureDetector(
                      onTap: singUp,
                      child: Container(
                        padding:EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color:Colors.orange,
                            borderRadius: BorderRadius.circular(12)),
                        child:Center(
                          child: Text("Sign Up ",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            )
        )

    );
  }
}


