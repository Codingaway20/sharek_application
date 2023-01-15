
import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  String ?id;
  String ?email;
  String ?password;
  String ?phone;
  String ?Tripid;

  Client({
    this.id = '',
    required this.email,
    required this.password,
    required this.phone,
    required this.Tripid,
  });

  Map<String , dynamic> toClient()=>{
    'id' : id,
    'email' : email,
    'password': password,
    'phone'  : phone,
    'tripid': Tripid,
  };

  static Client fromJson(Map<String ,dynamic> json) => Client(
    id: json['id'],
    email: json['email'],
    password: json['password'],
    phone: json['phone'],
    Tripid: json['tripid'],
  );

  Future createClient ({required String email , required String password , required String phone , required String tripid}) async{

    final docClient = FirebaseFirestore.instance.collection('Clinet').doc();

    final client1 = Client(
        id: docClient.id,
        email: email,
        password: password,
        phone: phone,
        Tripid : tripid,
    );

    final client = client1.toClient();

    //create document
    await docClient.set(client);
  }

}