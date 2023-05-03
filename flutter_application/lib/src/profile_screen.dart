import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ProfileScreen extends StatefulWidget {
  final String idUser;

  const ProfileScreen({required this.idUser});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
 

  
class _ProfileScreenState extends State<ProfileScreen> {
  // Algunos datos de ejemplo
  late String name = "";
  late String surname = "";
  late String username="";

  Future<void> _getUser() async {
    print("hi");
    final response = await Dio().get('http://192.168.56.1:3002/user/'+widget.idUser);
    print(widget.idUser+"hey");
    final data = response.data;
    if (response.statusCode==200){
      setState(() {
      this.name=response.data['name'];
      this.surname=response.data['surname'];
      this.username=response.data['username'];
      });
    }
    else{
      print("bad shit");
    }
    
  }

  @override
  void initState() {
    print("ARE YU HERE YU IDIOT");
    super.initState();
    _getUser();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        shadowColor: Color.fromRGBO(0, 0, 128, 4),
        backgroundColor: Color.fromRGBO(0, 0, 128, 4),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 104, 96, 139),
            
            ),
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor:Color.fromRGBO(0, 0, 128, 4),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              surname,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              username,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
