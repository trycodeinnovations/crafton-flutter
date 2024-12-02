import 'package:cloud_firestore/cloud_firestore.dart';

Future deleteworkfun(id) async{
FirebaseFirestore firestore=FirebaseFirestore.instance;
try {
  firestore.collection("artistwork").doc(id).delete();
  
} catch (e) {
  
}

}