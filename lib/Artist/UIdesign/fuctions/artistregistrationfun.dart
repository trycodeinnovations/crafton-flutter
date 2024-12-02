import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future register(data) async{
  
print('ugtdf'); 
FirebaseAuth auth =FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
try {
   UserCredential usercredential=await auth.createUserWithEmailAndPassword(email: data["email"], password: data["password"]);
    
  print("success");
  
 firestore.collection('artists').doc().set(data);
 
} catch (e) {
  print(e);
}
 





}