// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crafton/UIdesigns/loginfun.dart';
// import 'package:crafton/models/Artistworklistmodel.dart';
// import 'package:crafton/models/customergetworklistmodel.dart';

// // List<Artistworklistmodel> hgfhgf= [];
// // add()async{
// //   hgfhgf=await getworklistfunction();
// // }
// // 


// Future<List<Customergetworkmodel>> 
// customergetworklistfunction()async{

  
//   try {
//     var update = FirebaseFirestore.instance.collection("artistwork");
//     QuerySnapshot querySnapshot = await update.get();
//     print(querySnapshot.docs);
//   List<Customergetworkmodel>  customergetworklist = querySnapshot.docs.map((doc) {
//       return Customergetworkmodel(

//         artistid:doc['artistid']??'',
//           id:doc.id,
          
//           image: doc['image']??'',
//           name: doc['nameofthework']??'',
//           subtype: doc['subtype']??'',
//           price: doc['price']??'',
//           description: doc['description']??'',
//           previouswork: doc['previouswork']??'',
          
//           );
//     }).toList();
    



    
// return customergetworklist;
//   } catch (e) {
//     print(e);
//     return [];
//   }

// }