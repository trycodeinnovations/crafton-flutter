import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


Future Artistaddworkfun(data,context) async{
print('ugtdf'); 
FirebaseFirestore firestore=FirebaseFirestore.instance;
print("11111111111111122222222222222222222223333333333333");
try {
  
 firestore.collection('artistwork').add(data);
  ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("successfully added")));
         
 print("success");
} catch (e) {
  print(e);
}
 





}