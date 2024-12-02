import 'package:cloud_firestore/cloud_firestore.dart';

addcomplaintfun(data){
   FirebaseFirestore firestore=FirebaseFirestore.instance;
  try {

        firestore.collection("Complaint").add(data);
        print("kkkk");
    
  } catch (e) {
    print(e);
  }

}