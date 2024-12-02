import 'package:crafton/models/artistmodel.dart';
import 'package:flutter/material.dart';

class AdminViewapprovedartistdetails extends StatelessWidget {
  final Artistmodel artistapproved;
  const AdminViewapprovedartistdetails({super.key, required this.artistapproved});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // Matching previous app bar color
        title: const Text(
          "Artist Details",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Back button color
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Centering profile section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.teal[100],
                      radius: 40,
                      child: Text(
                        artistapproved.name.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      artistapproved.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Info Container 1 - Place
            Card(elevation: 5,
              child: Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                  borderRadius: BorderRadius.circular(7),
                 
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.teal),
                    const SizedBox(width: 10),
                    Text(
                      artistapproved.place,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Info Container 2 - District
           Card(elevation: 5,
              child: Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                  borderRadius: BorderRadius.circular(7),
                 
                ),
                child: Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.teal),
                    const SizedBox(width: 10),
                    Text(
                      artistapproved.phonenumber,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Info Container 3 - Post
          Card(elevation: 5,
              child: Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                  borderRadius: BorderRadius.circular(7),
                 
                ),
                child: Row(
                  children: [
                    const Icon(Icons.map, color: Colors.teal),
                    const SizedBox(width: 10),
                    Text(
                      artistapproved.district,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), //
            Card(elevation: 5,
              child: Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                  borderRadius: BorderRadius.circular(7),
                 
                ),
                child: Row(
                  children: [
                    const Icon(Icons.local_post_office, color: Colors.teal),
                    const SizedBox(width: 10),
                    Text(
                      artistapproved.post,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(), // Push buttons to the bottom

            // Approve and Reject Buttons
          
            const SizedBox(height: 20), // Add some space at the bottom
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
