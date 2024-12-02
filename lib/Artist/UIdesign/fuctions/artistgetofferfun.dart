import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:crafton/models/artistgetoffermodel.dart';


Future<List<Artistgetoffermodel>> artistgetofferfunc()async{

  
  try {
    var update = FirebaseFirestore.instance.collection("offer").where('artistid',isEqualTo: artistid);
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
  List<Artistgetoffermodel>  artistofferlist = querySnapshot.docs.map((doc) {
      return Artistgetoffermodel(

        
          id:doc.id,
          artistid: doc['artistid']??'',
         
          offer: doc['offer']??'',
          
          );
    }).toList();
    artistofferlist=artistofferlist;
    print(artistofferlist.length);
    
    print("hahahaha");
    // print("hhhhhhhh");
    // print(employeedata[0].age);
  return artistofferlist;

  } catch (e) {
    print(e);
    return [];
  }

}