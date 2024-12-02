import 'package:crafton/models/customergetallartist.dart';
import 'package:crafton/models/customergetoffermodel.dart';
import 'package:crafton/models/customergetworklistmodel.dart';
import 'package:crafton/models/customerviewartistgallerymodel.dart';
import 'package:crafton/user/Uidesign/orderpage.dart';
import 'package:flutter/material.dart';

class Artistpagefromwork extends StatelessWidget {
  final List<Customergetworkmodel> works;
  final List<Customergetallartistmodel> artist;
  final List<customergetgallerymodel> otherworks;
  final List<Customergetoffermodel> offer;
 
  
  const Artistpagefromwork({super.key, required this.works, required this.artist, required this.otherworks, required this.offer,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          artist.first.name,
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
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          // backgroundImage: NetworkImage(artist.profileImage), // Assuming profile image exists
                          backgroundColor: Colors.grey[300],
                          child: Text(artist.first.name.substring(0,1),style: const TextStyle(fontSize: 42)),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        artist.first.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        artist.first.place,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        artist.first.phonenumber, // Replace with dynamic phone if available
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                      "No brochures available.",
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


              // Works Section (Horizontal Scroll with Cards)
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
                                artistname:artist.first.name,
                                artistphonenumber:artist.first.phonenumber,
                                artistplace:artist.first.place,
                                artistlandmark:artist.first.landmark
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
                itemCount: otherworks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        otherworks[index].gallery,
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
