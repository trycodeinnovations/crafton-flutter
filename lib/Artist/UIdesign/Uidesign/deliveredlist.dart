import 'package:crafton/Artist/UIdesign/Uidesign/deliveredpege.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:crafton/models/artistviewordermodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart'; // For Timestamp

class deliveredListPage extends StatelessWidget {
   const deliveredListPage({super.key, required this.deliveredlist,});
    final List<Artistviewordermodel> deliveredlist;
  @override
  Widget build(BuildContext context) {
    
   

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Orders', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal, // Matching AppBar color
      ),
      body: Consumer<Artistprovider>(builder: (context, value, child) =>  ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: deliveredlist.length,
          itemBuilder: (context, index) {
           
        
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                
              ),
             
              elevation: 7,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Work Name
                    Text(
                    deliveredlist.first.subtype,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
        
                    // Count & Customer Name
                    _buildOrderDetail('Customer Name', deliveredlist.first.customername),
                  
        // _buildOrderDetail(
        //   'Delivery Date',
        //   formatTimestamp(waitinglist.first.deliverydate),
        // ),
                    const SizedBox(height: 12),
        
                    // Button to view details or perform an action
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Define your action here (e.g., navigate to details, mark as accepted)
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => deliveredOrderDetailsPage(details:deliveredlist[index]),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          backgroundColor: Colors.teal, // Matching purple color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'View Details',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }
}
String formatTimestamp(Timestamp timestamp) {
  DateTime date = timestamp.toDate(); // Convert Timestamp to DateTime
  return DateFormat('dd-MM-yyyy').format(date); // Format the DateTime
}

