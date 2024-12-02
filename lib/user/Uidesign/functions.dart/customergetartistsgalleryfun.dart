

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/models/customerviewartistgallerymodel.dart';

Future<List<customergetgallerymodel>> 
customergetartistgalleryfun()async{

  
  try {
    var update = FirebaseFirestore.instance.collection("gallery");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
  List<customergetgallerymodel>  customerviewgallerylist = querySnapshot.docs.map((doc) {
      return customergetgallerymodel(

        artistid:doc['id']??'',
          id:doc.id,
          
          gallery: doc['previouswork']??'',
         
          
          );
    }).toList();
    


  
    
return customerviewgallerylist;
  } catch (e) {
    print(e);
    return [];
  }

}