
import 'package:cloud_firestore/cloud_firestore.dart';

editworkfun(data,id) async{
FirebaseFirestore firestore=FirebaseFirestore.instance;
try {

    firestore.collection("artistwork").doc(id).update(data);
    print("sucess");
  
} catch (e) {
  print(e);
}
}