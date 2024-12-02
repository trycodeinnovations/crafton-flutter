import 'package:crafton/models/customergetallartist.dart';
import 'package:crafton/models/customergetworklistmodel.dart';
import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/user/Uidesign/artistpagefromwork.dart';
import 'package:crafton/user/Uidesign/orderpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkFullDetails extends StatelessWidget {
  final Customergetworkmodel work;
  final List<Customergetallartistmodel> artist;

  const WorkFullDetails({
    super.key,
    required this.work,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(work.subtype, style: const TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section - Takes 1/4 of the screen height
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(work.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Work Name and Price
            Text(
              work.subtype,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '₹${work.price}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              work.description,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 16),

            // Artist Identification - Clickable Container
            GestureDetector(
              // onTap: 'onArtistTap',
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Text(
                        artist.first.name.substring(0, 1),
                        style: const TextStyle(fontSize: 26),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            artist.first.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            artist.first.place,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<Customerprovider>(builder: (context, value, child) => 
                       IconButton(
                        onPressed: () {
                              final selectedArtist = artist;
                                    final otherworks = value.customerviewgallerylist
                                        .where((work) => work.artistid == selectedArtist.first.id)
                                        .toList();
                                    final artistWorks = value.customerworkbyartistlist
                                        .where((work) => work.artistid == selectedArtist.first.id)
                                        .toList();
                                    final offer=value.customergetofferlist.where((work) => work.artistid == selectedArtist.first.id)
                                        .toList();
                            Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Artistpagefromwork(
                                    works: artistWorks,artist:selectedArtist,otherworks:otherworks,offer:offer
                                  ),
                                ));
                        },
                        icon: const Icon(Icons.arrow_forward, color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),

            // Order Now Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OrderPage(
 workss: work,
                                artistname:artist.first.name,
                                artistphonenumber:artist.first.phonenumber,
                                artistplace:artist.first.place,
                                artistlandmark:artist.first.landmark                                  ),
                                ));

                  // Action for order
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Order Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
