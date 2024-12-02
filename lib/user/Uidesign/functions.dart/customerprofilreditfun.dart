
import 'package:cloud_firestore/cloud_firestore.dart';

 customerprofileeditfun(data,id) async{
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  try {

     firestore.collection("customers").doc(id).update(data);
     print("sucess");
    
  } catch (e) {
    print(e);
  }
}