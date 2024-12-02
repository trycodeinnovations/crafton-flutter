import 'package:cloud_firestore/cloud_firestore.dart';

artistapprovefun(data,id){
   FirebaseFirestore firestore=FirebaseFirestore.instance;
  try {

        firestore.collection("artists").doc(id).update(data);
        print("kkkk");
    
  } catch (e) {
    print(e);
  }

}


artistrejectfun(data,id){
   FirebaseFirestore firestore=FirebaseFirestore.instance;
  try {

        firestore.collection("artists").doc(id).update(data);
        print("kkkk");
    
  } catch (e) {
    print(e);
  }

}
