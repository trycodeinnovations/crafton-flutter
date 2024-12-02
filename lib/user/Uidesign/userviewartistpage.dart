import 'package:crafton/models/customergetallartist.dart';
import 'package:crafton/models/customergetoffermodel.dart';
import 'package:crafton/models/customergetworklistmodel.dart';
import 'package:crafton/models/customerviewartistgallerymodel.dart';
import 'package:crafton/user/Uidesign/orderpage.dart';
import 'package:flutter/material.dart';

class Artistpage extends StatelessWidget {
  final Customergetallartistmodel artist;
  final List<Customergetworkmodel> works;
  final List<customergetgallerymodel> otherwork;
  final List<Customergetoffermodel>offer;
  
  const Artistpage({super.key, required this.artist, required this.works, required this.otherwork, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          artist.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Artist Card
            Card(
  elevation: 2,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12), // Slightly smaller border radius
  ),
  child: Padding(
    padding: const EdgeInsets.all(12.0), // Reduced padding
    child: Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 40, // Reduced radius
            backgroundColor: Colors.grey[300],
            child: Text(
              artist.name.substring(0, 1),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600), // Smaller font size
            ),
          ),
        ),
        const SizedBox(height: 10), // Reduced space
        Text(
          artist.name,
          style: const TextStyle(
            fontSize: 20, // Smaller font size
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          artist.place,
          style: const TextStyle(
            fontSize: 14, // Smaller font size
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "9876876545", // Replace with dynamic phone if available
          style: TextStyle(
            fontSize: 14, // Smaller font size
            color: Colors.black54,
          ),
        ),
      ],
    ),
  ),
),

              const SizedBox(height: 20),

              // Works Section (Horizontal Scroll with Cards)
                const Text(
                "Offers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              offer.isEmpty
                  ? const Text(
                      "No Offers available.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    )
                  : SizedBox(
                      height: 180, // Adjust height for brochure cards
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: offer.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                // Handle brochure interaction (e.g., viewing or downloading)
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    // title: Text("Brochure Preview"),
                                    content: Image.network(
                                      offer[index].offer,
                                      fit: BoxFit.cover,
                                    ),
                                    
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text("Close"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 4,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    offer[index].offer,
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 150,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

              const Text(
                "Works",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180, // Increased height for a larger image
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: works.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OrderPage(
                                workss: works[index],
                                  artistname:artist.name,
                                artistphonenumber:artist.phonenumber,
                                artistplace:artist.place,
                                artistlandmark:artist.landmark

                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          child: SizedBox(
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    works[index].image,
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 130,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    works[index].subtype,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\$${works[index].price}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // More Works (GridView with Cards)
              const Text(
                "More Works",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: otherwork.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        otherwork[index].gallery,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
