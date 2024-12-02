import 'package:cloud_firestore/cloud_firestore.dart';


Future orderfunction(data) async{

FirebaseFirestore firestore=FirebaseFirestore.instance;

try {
  
 firestore.collection('order').add(data);
 print("success");
} catch (e) {
  print(e);
}
 





}