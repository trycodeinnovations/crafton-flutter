import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/Artisthome.dart';
import 'package:crafton/Artist/UIdesign/fuctions/getworklistfun.dart';
import 'package:crafton/admin/Uidesign/Uidesign/homescreen.dart';
import 'package:crafton/admin/Uidesign/functions/allartistgetfun.dart';
import 'package:crafton/admin/Uidesign/functions/allusergetfun.dart';
import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/user/Uidesign/functions.dart/customergetprofilefun.dart';
import 'package:crafton/user/Uidesign/userhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 String? artistid;
 String? customerid;
 String? status;


Future login(email, password, context) async {
  FirebaseAuth auther = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    UserCredential user = await auther.signInWithEmailAndPassword(
        email: email, password: password);
    if (user.user != null) {
      if (email == "admin@gmail.com") {
        artistgetfun();
        customergetfun();
           ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Success"))
                      );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Adminhomescreen(),
            ));
           
      }

      
       else  {
        
        QuerySnapshot<Map<String, dynamic>> artistDoc = await firestore
            .collection('artists')
            .where('email', isEqualTo: email)
            .get();
            print("aaaaaaaa");
        print(artistDoc.docs);
       await getworklistfunction();
       
        

        // print()
        if (artistDoc.docs.isNotEmpty) {
          // await artistprofilegetfun();
          
      
        await  getworklistfunction();
          print("Document exists");
          var artistdata=artistDoc.docs.first.data();
          

          
          // var fieldValue = artistDoc.get('fieldname');  // Replace 'fieldname' with the actual field name
          // print(fieldValue);
          artistid=artistDoc.docs.first.id;
          

            // Approve logic goes here
                        if (artistdata['status'] == 'Approved') {
            artistid = artistDoc.docs.first.id;
            await getworklistfunction();
            await customerprofilegetfun();
                          var provider = Provider.of<Customerprovider>(context, listen: false);

               await provider.customergetworkfun();
                await provider.customergetallartistlistfun();
                await provider.customergetworkbyartistfun();
                await provider.customergetgalleryfunction();
                await provider.customergetofferfunction();
                 await provider.customergetallartistlistfun();
                await provider.customergetworkbyartistfun();
                await provider.customergetgalleryfunction();
                 await provider.customergetofferfunction();
                 await provider.customergetorderfun();


            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Artist login successful")));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Artisthomescreen()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Access denied: Approval pending")));
          }
        } else {
          print("customer");
 QuerySnapshot<Map<String, dynamic>> customerDoc = await firestore
            .collection('customers')
            .where('email', isEqualTo: email)
            .get();
            await customerprofilegetfun();
            print(customerDoc.docs);
                    if (customerDoc.docs.isNotEmpty) {
                      customerid=customerDoc.docs.first.id;
                      print("done");
                         ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Success"))
                      );
          // Validate the password
           Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Userhomescreen()));
        
        }        }
       
//        
      }
      
      
      //  print("success");
    } else {
         ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("failed"))
                      );
      print("failed");
      
    }
  } catch (e) {
    print(e);
  }
}

// Future<void> login(BuildContext context, String email, String password) async {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   try {
//     // Attempt to sign in the user
//     UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
//     User? user = userCredential.user;

//     if (user != null) {
//       // Check if the user is the admin
//       if (email == "admin@example.com") { // Replace with your admin email
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => AdminHomeScreen()),
//         );
//       } else {
//         // Check in the artists collection
//         DocumentSnapshot artistDoc = await firestore.collection('artists').doc(user.uid).get();
//         if (artistDoc.exists) {
//           // Validate the password
//           if (artistDoc['password'] == password) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => ArtistHomeScreen()),
//             );
//             artistgetfun();
//             customergetfun();
//           } else {
//             print("Incorrect password for artist");
//           }
//         } else {
//           // Check in the customers collection
//           DocumentSnapshot customerDoc = await firestore.collection('customers').doc(user.uid).get();
//           if (customerDoc.exists) {
//             // Validate the password
//             if (customerDoc['password'] == password) {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => CustomerHomeScreen()),
//               );
//               customergetfun();
//             } else {
//               print("Incorrect password for customer");
//             }
//           } else {
//             print("User does not belong to any role");
//           }
//         }
//       }
//     } else {
//       print("Login failed: User is null");
//     }
//   } catch (e) {
//     print("Login failed: $e");
//   }
// }
