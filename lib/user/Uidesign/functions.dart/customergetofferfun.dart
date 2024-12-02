import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/models/customergetoffermodel.dart';

Future<List<Customergetoffermodel>> customergetofferfun() async {
  try {
    var update = FirebaseFirestore.instance.collection("offer");
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs);
    List<Customergetoffermodel> customergetofferlist =
        querySnapshot.docs.map((doc) {
      return Customergetoffermodel(
        artistid: doc['artistid'] ?? '',
        id: doc.id,
        artistname: doc['artistname'] ?? '',
        landmark: doc['artistlandmark'] ?? '',
        artistphone: doc['phonenumber'] ?? '',
        offer: doc['offer'] ?? '',
      );
    }).toList();

    return customergetofferlist;
  } catch (e) {
    print(e);
    return [];
  }
}
