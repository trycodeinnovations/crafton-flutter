import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/Artisthome.dart';
import 'package:crafton/admin/Uidesign/Uidesign/homescreen.dart';
import 'package:crafton/admin/Uidesign/functions/allartistgetfun.dart';
import 'package:crafton/admin/Uidesign/functions/allusergetfun.dart';
import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/user/Uidesign/userhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> loginpage(BuildContext context, String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Attempt to sign in the user
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    if (user != null) {
      // Check if the user is the admin
      if (email =="admin@gmail.com") { // Replace with your admin email
        artistgetfun();
        customergetfun();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Adminhomescreen()),
        );
      } else {
        // Check in the artists collection
 QuerySnapshot<Map<String, dynamic>> artistDoc = await firestore
            .collection('artists')
            .where('email', isEqualTo: email)
            .get();
                    if (artistDoc.docs.isNotEmpty) {
                        var provider = Provider.of<Customerprovider>(context, listen: false);
                      await provider.customergetallartistlistfun();
          // Validate the password
           Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Artisthomescreen()));
        
        } else {
          // Check in the customers collection
          DocumentSnapshot customerDoc = await firestore.collection('customers').doc(user.uid).get();
          if (customerDoc.exists) {
          QuerySnapshot<Map<String, dynamic>> artistDoc = await firestore
            .collection('customers')
            .where('email', isEqualTo: email)
            .get();
                    if (artistDoc.docs.isNotEmpty) {
          // Validate the password
           Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Userhomescreen()));
        
        } 
          } else {
            print("User does not belong to any role");
          }
        }
      }
    } else {
      print("Login failed: User is null");
    }
  } catch (e) {
    print("Login failed: $e");
  }
}