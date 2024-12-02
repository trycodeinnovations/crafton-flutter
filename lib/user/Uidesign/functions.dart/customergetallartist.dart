import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/models/customergetallartist.dart';

Future <List<Customergetallartistmodel>>
customergetartistfun() async{

try {
   var update = FirebaseFirestore.instance.collection("artists");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs.length);
     customerviewartistlist1 = querySnapshot.docs.map((doc) {
      return Customergetallartistmodel
      (
id: doc.id,
          landmark:doc['landmark']??'',
          
          name: doc['name']??'',
          post: doc['post']??'',
          phonenumber: doc['phonenumber']??'',
          status: doc['status']??'',
          place: doc['place']??'',
          district: doc['district']??'',
          
          
        );
    }).toList();
    customerviewartistlist1=customerviewartistlist1;
    print(customerviewartistlist1.length);
    return customerviewartistlist1;
   





  
} catch (e) {

  print(e);
  return[];
  
}
}
