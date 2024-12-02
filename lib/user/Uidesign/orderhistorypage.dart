import 'package:crafton/models/ustomergetordersmodel.dart';
import 'package:crafton/user/Uidesign/paymentpage.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  final Customergetordermodel order;

  const OrderDetailsPage({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // Uncomment the following code to display the order image
                // child: Image.network(
                //   order.image, // Work image
                //   height: 200,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                //   errorBuilder: (context, error, stackTrace) =>
                //       Icon(Icons.broken_image, size: 50),
                // ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              order.subtype, // Work name
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Delivery Date: ${order.deliverydate}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Text(
              "Count: ${order.count}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: \$${order.totalprice}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
              const SizedBox(height: 10),
            Text(
              "Artist name: ${order.artistname}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),  const SizedBox(height: 10),
            Text(
              "Landmark: ${order.artistlandmark}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),  const SizedBox(height: 10),
            Text(
              "Phone no: ${order.artistphone}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),  const SizedBox(height: 10),
             Text(
              "Date: ${order.date}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ), 
          
            const SizedBox(height: 10),
            Text(
              "Status: ${order.status}",
              style: const TextStyle(fontSize: 16, color: Colors.teal),
            ),
               const SizedBox(height: 10),
            Text(
              "Payment: ${order.payment}",
              style: const TextStyle(fontSize: 16, color: Colors.teal),
            ),
            const SizedBox(height: 20),
             if(order.payment!='payed')...[
               if (order.status == 'accepted') ...[
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement payment logic here
                    print("Proceed to payment");
                    
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                totalprice:order.totalprice,
                                id:order.id

                              ),
                            ),
                          );
                    // You could navigate to a payment screen or open a payment modal
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Button color
                  ),
                  child: const Text("Make Payment"),
                ),
              ),
            ],
             ]
            
           
          ],
        ),
      ),
    );
  }
}
