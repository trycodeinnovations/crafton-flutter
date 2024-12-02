import 'package:crafton/admin/Uidesign/Uidesign/complaintpendinglist.dart';
import 'package:crafton/admin/Uidesign/Uidesign/repliedlist.dart';
import 'package:crafton/provider/adminprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Complaints extends StatelessWidget {
  const Complaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text(
          "Complaints",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal, // Vibrant app bar color
        elevation: 5, // Slight elevation for a shadow effect
     
      ),
      body:    Container(
        decoration: const BoxDecoration(
        
        ),
        padding: const EdgeInsets.all(20.0),
        child: Consumer<Adminprovider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await value.admingetcomplaintfunction();
                 await value.getartistfun();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ComplaintpendingListPage(
                     
                    ),
                  ));
                },
                style: ElevatedButton.styleFrom(
                 
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 7,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pending, color: Colors.black54,),
                    SizedBox(width: 10),
                    Text(
                      "Pending",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Consumer<Adminprovider>(builder: (context, value, child) => 
                 ElevatedButton(
                  onPressed: () async {
                    await value.getartistfun();
                    await value.admingetcomplaintfunction();
                    
                
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ComplaintrepliedListPage(
                       
                      ),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                   
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 7,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, color: Colors.black54),
                      SizedBox(width: 10),
                      Text(
                        "Replied",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}