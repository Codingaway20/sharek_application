
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sharek_application/pages/ClientClass.dart';

import 'home_page.dart';

class Registerpage extends StatefulWidget {

  final VoidCallback showLoginPage;
  const Registerpage({
    Key? key,
     required this.showLoginPage
  }) : super(key: key);

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ConfirmpasswordController = TextEditingController();
  final _PhoneController = TextEditingController();
  Client c1 = new Client(email: "", password: "", phone: "", Tripid: "");


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _ConfirmpasswordController.dispose();
    _PhoneController.dispose();
    super.dispose();
  }

  bool Password_confirmed() {
    if(_passwordController.text.trim() == _ConfirmpasswordController.text.trim()){
      return true;
    }
    return false;

  }

  Future singUp() async{
    if(Password_confirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      c1.createClient(email: _emailController.text.trim(), password: _passwordController.text.trim(), phone:_PhoneController.text.trim(), tripid: "");

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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.android_outlined,
                      size: 100,

                    ),
                    const SizedBox(height:75),
                    //Hello driver
                    const Text(
                      "Hello User !",
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
                        height: 30),
                    //username

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


                    const SizedBox(height: 25,),
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
                    const SizedBox(height: 25,),

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
                    const SizedBox(height: 25,),

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
                            controller: _PhoneController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone number",

                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
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
              ),
            )
        )

    );
  }
}
