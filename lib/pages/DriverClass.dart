import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Driver {
  String ?id;
  String ?email;
  String ?password;
  String ?phone;
  String ?plateNum;
  String ?carType;

  Driver({
    this.id = '',
    required this.email,
    required this.password,
    required this.phone,
    required this.plateNum,
    required this.carType,
  });

  Map<String , dynamic> toDriver()=>{
    'id' : id,
    'email' : email,
    'password': password,
    'phone'  : phone,
    'plateNum': plateNum,
    'carType' : carType,
  };

  static Driver fromJson(Map<String ,dynamic> json) => Driver(
    carType: json['caType'],
    email: json['email'],
    id: json['id'],
    password: json['password'],
    phone: json['phone'],
    plateNum: json['plateNum'],
  );



  Future createDriver ({required String email , required String password , required String phone , required String plate , required String CarType}) async{

    final docDriver = FirebaseFirestore.instance.collection('Driver').doc();

    final driver1 = Driver(
        id: docDriver.id,
        email: email,
        password: password,
        phone: phone,
        plateNum: plate,
        carType: CarType);

    final driver = driver1.toDriver();

    //create document
    await docDriver.set(driver);

  }

}