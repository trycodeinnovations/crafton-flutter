import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/models/artistmodel.dart';

Future artistgetfun() async{

try {
   var update = FirebaseFirestore.instance.collection("artists");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs.length);
     artistlist = querySnapshot.docs.map((doc) {
      return Artistmodel(

        
          id: doc.id,
          landmark:doc['landmark']??'',
          
          name: doc['name']??'',
          post: doc['post']??'',
          phonenumber: doc['phonenumber']??'',
          status: doc['status']??'',
          place: doc['place']??'',
          district: doc['district']??'',
          socialmedia: doc['socialmedia']??'',
          
        );
    }).toList();
   





  
} catch (e) {

  print(e);
  
}
}
List<Artistmodel> artistlist=[];