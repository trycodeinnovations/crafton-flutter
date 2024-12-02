import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/models/artistviewprofilemodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
List<Artistprofilemodel> artistprofilelist=[];

Future artistprofilegetfun() async{
var email =FirebaseAuth.instance.currentUser!.email;
try {
   var update = FirebaseFirestore.instance.collection("artists").where('email',isEqualTo: email);
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs.length);
     artistprofilelist = querySnapshot.docs.map((doc) {
      return Artistprofilemodel(

        
          id: doc.id,
          landmark:doc['landmark']??'',
          
          name: doc['name']??'',
          post: doc['post']??'',
          place: doc['place']??'',
          district: doc['district']??'',
          phonenumber: doc['phonenumber']??'',
          
        );
    }).toList();
   artistprofilelist=artistprofilelist;


print(artistprofilelist.length);


  
} catch (e) {

  print(e);
  
}

}
