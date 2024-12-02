
import 'package:cloud_firestore/cloud_firestore.dart';

artistprofileeditfun(data,id) async{
FirebaseFirestore firestore=FirebaseFirestore.instance;
try {

    firestore.collection("artists").doc(id).update(data);
    print("sucess");
  
} catch (e) {
  print(e);
}
}