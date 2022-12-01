import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';




class LoginPage extends StatefulWidget{

  final VoidCallback showRegisterpage;
  LoginPage({Key?key , required this.showRegisterpage}) : super(key: key);

  @override
  State<LoginPage> createState()=> _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future singIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),);
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
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
                  Icons.phone_android,
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
                  "Welcome back , You have been missed",
                  style:TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                    height: 30),

                //Email
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
                  padding: const EdgeInsets.symmetric(horizontal: 25),
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
                const SizedBox(height: 10,),

                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: singIn,
                    child: Container(
                      padding: const EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color:Colors.orange,
                        borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text("Sign in",style: TextStyle(
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

                //not a member ? Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      "Not a member",
                      style:TextStyle(
                        fontWeight:FontWeight.bold,
                      ) ,
                    ),
                    GestureDetector(
                      onTap:widget.showRegisterpage,
                      child: Text(
                        "Register Now",
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
          ),
        )
      )

    );
  }
}