import 'package:flutter/material.dart';
import 'package:sharek_application/pages/login_page.dart';

import '../pages/choose_register_page.dart';
import '../pages/register_page.dart';


class authpage extends StatefulWidget {
  const authpage({Key? key}) : super(key: key);

  @override
  State<authpage> createState() => _authpageState();
}

class _authpageState extends State<authpage> {

  bool showloginPage = true;

  void toggleScreens(){
    setState(() {
      showloginPage = !showloginPage;
    });

  }

  @override
  Widget build(BuildContext context) {
    if(showloginPage){
      return LoginPage(showRegisterpage: toggleScreens);
    }
    else{
      return ChooseRegister(showLoginPage: toggleScreens);

    }
  }
}
