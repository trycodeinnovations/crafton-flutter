import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/models/customergetworklistmodel.dart';

// List<Artistworklistmodel> hgfhgf= [];
// add()async{
//   hgfhgf=await getworklistfunction();
// }
// 


Future<List<Customergetworkmodel>> 
customergetworklistbyartistfunction()async{

  
  try {
    var update = FirebaseFirestore.instance.collection("artistwork");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
  List<Customergetworkmodel>  customerworkbyartistlist = querySnapshot.docs.map((doc) {
      return Customergetworkmodel(

        artistid:doc['artistid']??'',
          id:doc.id,
          
          image: doc['image']??'',
          name: doc['nameofthework']??'',
          subtype: doc['subtype']??'',
          price: doc['price']??'',
          description: doc['description']??'',
       
          
          );
    }).toList();
    


    // customergetworklist=customergetworklist;
    // print(customergetworklist.length);
    // print("hhhhhhhh");
    // print(employeedata[0].age);
    // return customergetalbumlist;
    
return customerworkbyartistlist;
  } catch (e) {
    print(e);
    return [];
  }

}