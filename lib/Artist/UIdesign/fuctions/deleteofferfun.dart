import 'package:cloud_firestore/cloud_firestore.dart';

Future deleteofferfun(id) async{
FirebaseFirestore firestore=FirebaseFirestore.instance;
try {
  firestore.collection("offer").doc(id).delete();
  
} catch (e) {
  
}

}