import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:crafton/models/Artistworklistmodel.dart';

// List<Artistworklistmodel> hgfhgf= [];
// add()async{
//   hgfhgf=await getworklistfunction();
// }

Future<List<Artistworklistmodel>> getworklistfunction()async{

  
  try {
    var update = FirebaseFirestore.instance.collection("artistwork").where('artistid',isEqualTo: artistid);
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
  List<Artistworklistmodel>  artistworklist = querySnapshot.docs.map((doc) {
      return Artistworklistmodel(

        
          id:doc.id,
          image: doc['image']??'',
          name: doc['nameofthework']??'',
          subtype: doc['subtype']??'',
          price: doc['price']??'',
          description: doc['description']??'',
        
          
          );
    }).toList();
    artistworklist=artistworklist;
    print(artistworklist.length);
    // print("hhhhhhhh");
    // print(employeedata[0].age);
return artistworklist;
  } catch (e) {
    print(e);
    return [];
  }

}