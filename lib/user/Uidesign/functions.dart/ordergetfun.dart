import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:crafton/models/ustomergetordersmodel.dart';

// List<Artistworklistmodel> hgfhgf= [];
// add()async{
//   hgfhgf=await getworklistfunction();
// }
// 


Future<List<Customergetordermodel>> 
customergetorderfunction()async{

  
  try {
    var update = FirebaseFirestore.instance.collection("order").where('customerid',isEqualTo: customerid);
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
  List<Customergetordermodel>  customergetorderlist = querySnapshot.docs.map((doc) {
      return Customergetordermodel(

        customerid:doc['customerid']??'',
          id:doc.id,
          
        
          count: doc['count']??'',
          subtype: doc['subtype']??'',
          payment: doc['payment']??'',
          totalprice: doc['totalprice']??'',
          status: doc['status']??'',
          deliverydate: doc['deliverydate']??'',
           date: doc['date']??'',
          artistlandmark: doc['artistlandmark']??'',
          artistname: doc['artistname']??'',
          artistphone: doc['artistphone']??'',
        
        
          
          );
    }).toList();
    


  
    
return customergetorderlist;
  } catch (e) {
    print(e);
    return [];
  }

}