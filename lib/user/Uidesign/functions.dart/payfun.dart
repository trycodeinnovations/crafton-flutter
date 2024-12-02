import 'package:cloud_firestore/cloud_firestore.dart';

paymentfun(data,id){
   FirebaseFirestore firestore=FirebaseFirestore.instance;
  try {

        firestore.collection("order").doc(id).update(data);
        print("kkkk");
    
  } catch (e) {
    print(e);
  }

}