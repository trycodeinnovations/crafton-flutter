
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

sendreplyfun(data,id,context){
   FirebaseFirestore firestore=FirebaseFirestore.instance;
  try {

        firestore.collection("Complaint").doc(id).update(data);
        print("kkkk");
          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Success"))
                      );
    
  } catch (e) {
    print(e);
  }

}