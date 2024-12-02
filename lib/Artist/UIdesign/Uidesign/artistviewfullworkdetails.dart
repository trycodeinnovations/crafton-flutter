import 'package:crafton/Artist/UIdesign/Uidesign/artisteditworks.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:crafton/models/Artistworklistmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Viewworkdetails extends StatelessWidget {
  final Artistworklistmodel artistwork;
  const Viewworkdetails({super.key, required this.artistwork});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      appBar: AppBar(
        title: const Text("Work Details"),
        backgroundColor: Colors.teal, // Consistent app bar color (purple)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<Artistprovider>(builder: (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ArtistEditwork(
                            type: artistwork.name,
                            subtype: artistwork.subtype,
                            price: artistwork.price,
                            image: artistwork.image,
                            description: artistwork.description,
                            id: artistwork.id
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit, color: Colors.black), // Changed to black
                  ),
                  IconButton(
                    onPressed: () async{
                    await  value.deletefun(artistwork.id);
  // Navigator.pushReplacement(
  //                         context,
  //                         MaterialPageRoute(builder: (context) => Artistworklist()),
  //                       );     
                                       },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ),
            Container(
              height: 200, // Constrain height to avoid overflow
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12),
                color: const Color(0xFFE1BEE7), // Light purple background for image
                image: DecorationImage(
                  image: NetworkImage(artistwork.image),
                  fit: BoxFit.cover, // Adjust image scaling to prevent overflow
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              artistwork.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color changed to black
              ),
            ),
            const SizedBox(height: 8),
            _detailCard(
              label: artistwork.subtype,
              color:Colors.white, // Consistent with the light purple color
            ),
            _detailCard(
              label: "₹: ${artistwork.price}",
              color:Colors.white, // Consistent with the light purple color
            ),
            _detailCard(
              label: artistwork.description,
              color:Colors.white, // Consistent with the light purple color
              height: 80,
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _detailCard({required String label, double height = 60, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        elevation: 8,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color, // Apply the specified color
            border: Border.all(color: Colors.black12),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.w500,
                  color: Colors.black, // Text color changed to black
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis, // Prevent text overflow
                maxLines: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
