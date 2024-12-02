import 'package:crafton/admin/Uidesign/Uidesign/pendingartistpage.dart';
import 'package:crafton/admin/Uidesign/functions/allartistgetfun.dart';
import 'package:crafton/models/artistmodel.dart';
import 'package:flutter/material.dart';

class AdminviewpendingArtistlist extends StatelessWidget {
 final List<Artistmodel>pendinglist;
   AdminviewpendingArtistlist({super.key, required this.pendinglist});

  final artist = artistlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Artists",
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
          itemCount: pendinglist.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10,),
                        CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[100],
                        child: Text(
                          pendinglist[index].name[0].toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[800],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pendinglist[index].name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                 
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                pendinglist[index].place,
                                style: const TextStyle(
                                  fontSize: 14,
                                 
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdminViewpendingartistdetails(artistpending: pendinglist[index]),
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
