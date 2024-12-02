import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:crafton/models/gallerymodel.dart';

// List<Artistworklistmodel> hgfhgf= [];
// add()async{
//   hgfhgf=await getworklistfunction();
// }

Future<List<Gallerymodel>> getgallryfun()async{

  
  try {
    var update = FirebaseFirestore.instance.collection("gallery").where('id',isEqualTo: artistid);
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
  List<Gallerymodel>  gallerylist = querySnapshot.docs.map((doc) {
      return Gallerymodel(

        
          id:doc.id,
         
          previouwork: doc['previouswork']??'',
          
          );
    }).toList();
    gallerylist=gallerylist;
    print(gallerylist.length);
    
    print("hahahaha");
    // print("hhhhhhhh");
    // print(employeedata[0].age);
  return gallerylist;

  } catch (e) {
    print(e);
    return [];
  }

}