import 'package:crafton/models/customergetworklistmodel.dart';
import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:crafton/user/Uidesign/functions.dart/addrefrenceimagefun.dart';
import 'package:crafton/user/Uidesign/functions.dart/customergetprofilefun.dart';
import 'package:crafton/user/Uidesign/functions.dart/orderfun.dart';
import 'package:crafton/user/Uidesign/userviewallartist1.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


List<String> urls = [];

class OrderPage extends StatefulWidget {
  final Customergetworkmodel workss;
   

  final String artistphonenumber;
  final String artistplace;
  final String artistname;
  final String artistlandmark;

  const OrderPage({

    super.key,
    required this.workss, required this.artistphonenumber, required this.artistplace, required this.artistname, required this.artistlandmark,
  });

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> images = [];
  double totalprice = 0;

  final TextEditingController _dateController = TextEditingController();
  TextEditingController description=TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Page',
          style: TextStyle(fontWeight: FontWeight.bold),
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
              // Work Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    widget.workss.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Work Name
              Text(
                widget.workss.subtype, // Replace with actual work name
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // Count Increment/Decrement & Total Amount
              Consumer<Customerprovider>(
                builder: (context, value, child) {
                  // Calculate total price based on count and price
                  totalprice = value.count * double.parse(widget.workss.price);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Decrement button
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            color: Colors.teal,
                            iconSize: 30,
                            onPressed: () {
                              value.countdecrement();
                            },
                          ),
                          // Count text
                          Text(
                            value.count.toString(), // Count value
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Increment button
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            color: Colors.teal,
                            iconSize: 30,
                            onPressed: () {
                              value.countincrement();
                            },
                          ),
                        ],
                      ),
                      // Total amount display
                      Text(
                        '\$${totalprice.toStringAsFixed(2)}', // Display total price
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),

              // Image Picker
              const Text(
                'Upload Reference Image:',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    List<XFile> photos = await _picker.pickMultiImage();
                    setState(() {
                      images = photos;
                    });
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.teal.withOpacity(0.5)),
                    ),
                    child: const Icon(
                      Icons.add_a_photo,
                      size: 40,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
                  const Text(
                'Description:',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: description,
                
                decoration: InputDecoration(
                  hintText: "Description",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.teal.withOpacity(0.5)),
                  ),
                ),
              
              ),

              // Date Picker Field
              const Text(
                'Select Delivery Date:',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Choose a delivery date",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.teal.withOpacity(0.5)),
                  ),
                  suffixIcon: const Icon(Icons.calendar_today, color: Colors.teal),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                      _dateController.text =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                },
              ),
              const SizedBox(height: 30),

              // Order Button
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Consumer<Customerprovider>(
                    builder: (context, value, child) => ElevatedButton(
                      onPressed: () async {
                        if (selectedDate != null) {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => PaymentScreen(
                          //       artistid: widget.workss.artistid,
                          //       totalprice: totalprice,
                          //       subtype: widget.workss.subtype,
                          //       count: value.count,
                          //       customerid: customerid,
                          //       images: images,
                          //       customerdet: customerprofilelist,
                          //       deliveryDate: selectedDate!, // Passing the selected date
                          //     ),
                          //   ),
                          // );
                          String status = 'pending';
                          String payment = 'notpayed';
                          String systemDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
                          for (XFile img in images) {
                            String url = await addreferenceimage(img);
                            urls.add(url);
                          }
                                                  Map<String, dynamic> data = {
                            // "image":
                            "artistid": widget.workss.artistid,
                            "totalprice": totalprice,
                            "count": value.count,
                            'customerid': customerid,
                            'subtype': widget.workss.subtype,
                            'phonenumber':customerprofilelist.first.phonenumber,
                            'artistname':widget.artistname,
                            'artistphone':widget.artistphonenumber,
                            'artistlandmark':widget.artistlandmark,
                            'date':systemDate,

                            "referenceimage": urls,
                            "place": customerprofilelist.first.place,
                            "name": customerprofilelist.first.name,
                            "post": customerprofilelist.first.post,
                            "deliverydate": selectedDate,
                            "status": status,
                            "payment": payment
                          };
                          print(customerprofilelist.first.name);
                          orderfunction(data);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Userviewallartist1(),
                            ),
                          );
                        } else {
                          // Show a dialog or snack bar to select a date if it's null
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please select a delivery date.')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Order Now',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
