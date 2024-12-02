import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/models/customermodel.dart';

Future customergetfun() async{

try {
   var update = FirebaseFirestore.instance.collection("customers");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs.length);
    print(customerlist.length);
     customerlist= querySnapshot.docs.map((doc) {
      return Customermodel(

        
          id: doc.id,
          
          name: doc['name']??'',
          post: doc['post']??'',
          place: doc['place']??'',
          district: doc['district']??'',
           age: doc['age']??'',
           phonenumber: doc['phonenumber']??'',
           image: doc['image']??'',
        );
    }).toList();
   





  
} catch (e) {

  print(e);
  
}
}

List<Customermodel> customerlist=[];