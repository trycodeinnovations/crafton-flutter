import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/user/Uidesign/userviewartistpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Userviewallartist1 extends StatefulWidget {
  const Userviewallartist1({super.key});

  @override
  _Userviewallartist1State createState() => _Userviewallartist1State();
}

class _Userviewallartist1State extends State<Userviewallartist1> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: const Text('Artists'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search by Artist Name or Place',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  prefixIcon: const Icon(Icons.search, color: Colors.teal),
                ),
              ),
            ),

            // Artist List
            Expanded(
              child: Consumer<Customerprovider>(
                builder: (context, value, child) {
                  // Filter artists based on search query
                  final filteredArtists = customerviewartistlist.where((artist) {
                    final artistName = artist.name.toLowerCase();
                    final artistPlace = artist.place.toLowerCase();
                    return artistName.contains(_searchQuery) || artistPlace.contains(_searchQuery);
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredArtists.length,
                    itemBuilder: (BuildContext context, int index) {
                      final selectedArtist = filteredArtists[index];
                      final otherworks = value.customerviewgallerylist
                          .where((work) => work.artistid == selectedArtist.id)
                          .toList();
                      final artistWorks = value.customerworkbyartistlist
                          .where((work) => work.artistid == selectedArtist.id)
                          .toList();
                      final offer = value.customergetofferlist
                          .where((work) => work.artistid == selectedArtist.id)
                          .toList();

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4,
                          child: Container(
                            height: 140,
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                // Artist Avatar
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.grey[300],
                                ),
                                const SizedBox(width: 15),

                                // Artist Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        selectedArtist.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        selectedArtist.place,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        selectedArtist.district,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        selectedArtist.landmark,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Arrow Icon for Navigation
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Artistpage(
                                          artist: selectedArtist,
                                          works: artistWorks,
                                          otherwork: otherworks,
                                          offer: offer,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
