

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/models/admingetcomplaintmodel.dart';

Future<List<Admingetcomplaintmodel>> 
admingetcomplaintfun()async{

  
  try {
    var update = FirebaseFirestore.instance.collection("Complaint");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
  List<Admingetcomplaintmodel>  adminviewcomplaintlist = querySnapshot.docs.map((doc) {
      return Admingetcomplaintmodel(

        customerid:doc['senderID']??'',
          id:doc.id,
          title:doc['title']??'',
          complaint:doc['complaint']??'',
          
          reply: doc['reply']??'',
         
          
          );
    }).toList();
    


  
    
return adminviewcomplaintlist;
  } catch (e) {
    print(e);
    return [];
  }

}