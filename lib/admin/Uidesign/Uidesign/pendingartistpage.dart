import 'package:crafton/admin/Uidesign/functions/allartistgetfun.dart';
import 'package:crafton/admin/Uidesign/functions/artistapproverejectfun.dart';
import 'package:crafton/models/artistmodel.dart';
import 'package:crafton/provider/adminprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminViewpendingartistdetails extends StatelessWidget {
  final Artistmodel artistpending;
  const AdminViewpendingartistdetails({super.key, required this.artistpending});

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
        child: ListView(
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
                        artistpending.name.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      artistpending.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple[900],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Info Container 1 - Place
            Card(
              elevation: 5,
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
                      artistpending.place,
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

            // Info Container 2 - Phone Number
            Card(
              elevation: 5,
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
                      artistpending.phonenumber,
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

            // Info Container 3 - District
            Card(
              elevation: 5,
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
                      artistpending.district,
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

            // Info Container 4 - Post
            Card(
              elevation: 5,
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
                      artistpending.post,
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

            // Info Container 5 - Social Media
            Card(
              elevation: 5,
              child: Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.account_box, color: Colors.teal),
                    const SizedBox(width: 10),
                    Text(
                      artistpending.socialmedia,
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
              ElevatedButton(
                    onPressed: () {
                      final url =artistpending.socialmedia ;
                      if (url.isNotEmpty
                      //  && isValidURL(url)
                       ) {
                         _launchURL(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Invalid URL! Please enter a valid link."),
                          ),
                        );
                      }
                    },
                    child: const Text("Test Social Media Link"),
                  ),
                   const SizedBox(height: 20),

            // Approve and Reject Buttons
            Consumer<Adminprovider>(
              builder: (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      String status = 'Approved';
                      Map<String, dynamic> data = {"status": status};
                      artistapprovefun(data, artistpending.id);
                      await value.getartistfun();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${artistpending.name} approved")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Approve",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String status = 'reject';
                      Map<String, dynamic> data = {"status": status};
                      artistrejectfun(data, artistpending.id);
                      await artistgetfun();
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${artistpending.name} rejected")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Reject",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
  
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
