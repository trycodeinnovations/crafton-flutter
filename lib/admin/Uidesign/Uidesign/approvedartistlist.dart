import 'package:crafton/admin/Uidesign/Uidesign/approvedartistdetails.dart';
import 'package:crafton/admin/Uidesign/functions/allartistgetfun.dart';
import 'package:crafton/models/artistmodel.dart';
import 'package:flutter/material.dart';

class AdminviewapprovedArtistlist extends StatelessWidget {
  final List<Artistmodel> approvedlist;
  AdminviewapprovedArtistlist({super.key, required this.approvedlist});

  final artist = artistlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Artists",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: approvedlist.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0), // Padding inside the card
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal[100],
                        child: Text(
                          approvedlist[index].name[0].toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[800],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              approvedlist[index].name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              approvedlist[index].place,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdminViewapprovedartistdetails(
                              artistapproved: approvedlist[index],
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
