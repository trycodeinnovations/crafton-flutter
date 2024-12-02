import 'package:crafton/admin/Uidesign/Uidesign/viewuserdetails.dart';
import 'package:crafton/admin/Uidesign/functions/allusergetfun.dart';
import 'package:flutter/material.dart';

class AdminviewUserlist extends StatelessWidget {
  const AdminviewUserlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: const Text(
          "Users",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal, // Vibrant app bar color
        elevation: 5, // Slight elevation for a shadow effect
      ),
      body: Container(
        // Adding a gradient background for modern look
        decoration: const BoxDecoration(
          
        ),
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: customerlist.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(elevation: 7,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  
                    
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                customerlist[index].name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                 
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                customerlist[index].place,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdminViewuserdetails(
                              user: customerlist[index],
                            ),
                          ));
                        },
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
