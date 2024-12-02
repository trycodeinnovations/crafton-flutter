
import 'package:cloud_firestore/cloud_firestore.dart';


//  orderacceptfun( id,data) async{
//   FirebaseFirestore firestore=FirebaseFirestore.instance;
//   try {

//         firestore.collection("order").doc(id).update(data);
//         print("kkkk");
    
//   } catch (e) {
//     print(e);
//   }
// }

orderacceptfun(data,id){
   FirebaseFirestore firestore=FirebaseFirestore.instance;
  try {

        firestore.collection("order").doc(id).update(data);
        print("kkkk");
    
  } catch (e) {
    print(e);
  }

}


orderrejectfun(data,id){
   FirebaseFirestore firestore=FirebaseFirestore.instance;
  try {

        firestore.collection("order").doc(id).update(data);
        print("kkkk");
    
  } catch (e) {
    print(e);
  }

}

orderdeliveredfun(data,id){
   FirebaseFirestore firestore=FirebaseFirestore.instance;
  try {

        firestore.collection("order").doc(id).update(data);
        print("kkkk");
    
  } catch (e) {
    print(e);
  }

}