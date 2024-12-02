import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


Future artistaddofferfun(data,context) async{
FirebaseFirestore firestore=FirebaseFirestore.instance;
try {
  
 firestore.collection('offer').add(data);
   ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("successfully added")));
         
 print("success");
} catch (e) {
  print(e);
}
 
}