// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crafton/models/artistmodel.dart';

// Future artistgetfun() async{

// try {
//    var update = FirebaseFirestore.instance.collection("artistwork");
//     QuerySnapshot querySnapshot = await update.get();
//     print(querySnapshot.docs.length);
//      artistlist = querySnapshot.docs.map((doc) {
//       return Artistmodel(

        
//           id: doc.id,
          
//           landmark:doc['landmark']??'',
          
//           name: doc['name']??'',
//           post: doc['post']??'',
//           place: doc['place']??'',
//           district: doc['district']??'',
          
//         );
//     }).toList();
   





  
// } catch (e) {

//   print(e);
  
// }
// }
// List<Artistmodel> artistlist=[];