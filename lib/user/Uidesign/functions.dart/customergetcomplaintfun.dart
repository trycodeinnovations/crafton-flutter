

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/models/customerviewcomplaintmodel.dart';

Future<List<Customerviewcomplaintmodel>> 
customergetcomplaintfun()async{

  
  try {
    var update = FirebaseFirestore.instance.collection("Complaint");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
  List<Customerviewcomplaintmodel>  customerviewcomplaintlist = querySnapshot.docs.map((doc) {
      return Customerviewcomplaintmodel(

        customerid:doc['senderID']??'',
          id:doc.id,
          title:doc['title']??'',
          complaint:doc['complaint']??'',
          
          reply: doc['reply']??'',
         
          
          );
    }).toList();
    


  
    
return customerviewcomplaintlist;
  } catch (e) {
    print(e);
    return [];
  }

}