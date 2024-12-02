import 'package:crafton/Artist/UIdesign/Uidesign/vieworderspage.dart';
import 'package:crafton/Artist/UIdesign/fuctions/orderacceptrejectfun.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:crafton/models/artistviewordermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerOrderDetailsPage extends StatelessWidget {
   CustomerOrderDetailsPage({super.key, required this.details});
  final Artistviewordermodel details;
  TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal, // Matching AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // To avoid overflow
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.grey[300], // Matching card color
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Work Name
                  _buildOrderDetail("Work Name", details.subtype),
                  const SizedBox(height: 10),

                  // Count
                  _buildOrderDetail("Count", details.count.toString()),
                  const SizedBox(height: 10),

                  // Customer Name
                  _buildOrderDetail("Customer Name", details.customername),
                  const SizedBox(height: 10),

                  // Post
                  _buildOrderDetail("Post", details.post),
                  const SizedBox(height: 10),

                  // Place
                  _buildOrderDetail("Place", details.place),
                  const SizedBox(height: 20),
                     _buildOrderDetail("Payment", details.payment),
                  const SizedBox(height: 20),
                   _buildOrderDetail("Requested date", details.date),
                  const SizedBox(height: 20),

                  // Reference Image (Placeholder for an image)
                  const Text(
                    'Reference Image:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                   GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: details.referenceimage.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        details.referenceimage[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller:name ,
                  ),

                  // Delivery Date
                  _buildOrderDetail("Delivery Date", "25-Oct-2024"),
                  const SizedBox(height: 20),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Accept Button
                      Consumer<Artistprovider>(
                        builder: (context, value, child) => ElevatedButton(
                          onPressed: (){
                          // Handle reject action
                          String status = 'accepted';
                          Map<String, dynamic> data = {
                            "status": status,
                          };
                          orderacceptfun(data, details.id);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ArtistOrdersPage(
                                 
                                ),
                              ),
                            );
                          
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Accept',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      // Reject Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle reject action
                          String status = 'rejected';
                          Map<String, dynamic> data = {
                            "status": status,
                          };
                          orderrejectfun(data, details.id);

                          // Pass the data map and the order id to the function
                          // Provider.of<Artistprovider>(context, listen: false)
                          //     .orderacceptfunction(data, details.id);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Reject',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Reusable widget for order details
  Widget _buildOrderDetail(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title:",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Flexible(
          // Added to avoid overflow
          child: Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            overflow: TextOverflow.ellipsis, // Prevent overflow with ellipsis
          ),
        ),
      ],
    );
  }
}
