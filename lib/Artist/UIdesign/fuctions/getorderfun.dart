import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:crafton/models/artistviewordermodel.dart';

// List<Artistworklistmodel> hgfhgf= [];
// add()async{
//   hgfhgf=await getworklistfunction();
// }
// 


Future<List<Artistviewordermodel>> 
artistgetorderfunction()async{

  
  try {
    var update = FirebaseFirestore.instance.collection("order").where('artistid',isEqualTo: artistid);
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
  List<Artistviewordermodel>  artistvieworderlist = querySnapshot.docs.map((doc) {
      return Artistviewordermodel(

        
          id:doc.id,
          
          totalprice: doc['totalprice']??'',
          customername: doc['name']??'',
          subtype: doc['subtype']??'',
          count: doc['count']??'',
          place: doc['place']??'',
          post: doc['post']??'',
          status: doc['status']??'',
          date: doc['date']??'',
          payment: doc['payment']??'',
          deliverydate: doc['deliverydate']??'',
          referenceimage: doc['referenceimage']??'',
       
          
          );
    }).toList();
    


    // customergetworklist=customergetworklist;
    // print(customergetworklist.length);
    // print("hhhhhhhh");
    // print(employeedata[0].age);
    // return customergetalbumlist;
    
return artistvieworderlist;
  } catch (e) {
    print(e);
    return [];
  }

}