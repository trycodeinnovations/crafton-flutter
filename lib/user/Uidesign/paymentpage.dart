import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/user/Uidesign/functions.dart/customergetprofilefun.dart';
import 'package:crafton/user/Uidesign/userviewallartist1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
   List <String> urls=[];
  final  String id;
  final double totalprice;
 
  PaymentScreen({super.key, required this.id, required this.totalprice,
    });

  ValueNotifier<String?> selectedPayment = ValueNotifier(null);

  // List of payment methods
  final List<String> _paymentMethods = ['UPI', 'Credit Card', 'Debit Card'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "BILL",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 46,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.teal.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  totalprice.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select Payment Method",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: selectedPayment,
              builder: (context, value, child) => Column(
                children: _paymentMethods.map((method) {
                  return RadioListTile<String>(
                    activeColor: Colors.teal,
                    title: Text(
                      method,
                      style: const TextStyle(color: Colors.black87),
                    ),
                    value: method,
                    groupValue: selectedPayment.value,
                    onChanged: (String? value) {
                      selectedPayment.value = value;
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                hintText: "UPI Number",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(color: Colors.teal.withOpacity(0.5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(color: Colors.teal.withOpacity(0.5)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Consumer<Customerprovider>(builder: (context, value, child) => 
 ElevatedButton(
                  onPressed: () async{
                    String payment='payed';
                    
                                      Map<String, dynamic> data = {
                                      // "image":
                                    "payment":payment
                                      
                
                                    };
                                    print(customerprofilelist.first.name);
                                    value.paymentfunction(data, id);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Userviewallartist1(),
                  ),
                );
                            
                    // Handle order action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Place Order",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
