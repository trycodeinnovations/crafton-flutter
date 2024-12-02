import 'package:crafton/provider/customerprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Offerpage extends StatelessWidget {
  const Offerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Offers',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<Customerprovider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.customergetofferlist.length,
            itemBuilder: (BuildContext context, int index) {
              final offer = value.customergetofferlist[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Card(
                  
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell( onTap: () {
                                // Handle brochure interaction (e.g., viewing or downloading)
                               showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Offer Preview"),
        const SizedBox(height: 8), // Adds space between the title and the artist's name
        Text(
          offer.artistname, // Assuming `offer.artistName` holds the artist's name
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          offer.artistphone, // Assuming `offer.artistName` holds the artist's name
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    ),
    content: Image.network(
      offer.offer,
      fit: BoxFit.cover,
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text("Close"),
      ),
    ],
  ),
);

                              },
                    child: Container(
                      
                      height: 170,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                      ),  child: Image.network(
                              offer.offer,
                              fit: BoxFit.fill,
                            ),
                      // child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       height: 130,
                      //       width: double.infinity,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(5),
                      //         border: Border.all(color: Colors.black12),
                      //       ),
                      //       clipBehavior: Clip.antiAlias,
                      //       child: Image.network(
                      //         offer.offer,
                      //         fit: BoxFit.fill,
                      //       ),
                      //     ),
                      //     const SizedBox(height: 8),
                      //     Text(
                      //       "Name: ${offer.artistname}",
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //     const SizedBox(height: 4),
                      //     Text(
                      //       "Phone: ${offer.artistphone}",
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.black87,
                      //       ),
                      //     ),
                      //     const SizedBox(height: 4),
                      //     Text(
                      //       "Landmark: ${offer.landmark}",
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.black54,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
