import 'package:crafton/provider/artistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtistEditwork extends StatelessWidget {
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  final String type; // New variable to store name of work
  final String subtype; // New variable to store subtype
  final String image; // New variable to store image URL
  final String description;
  final String price;
  final String id;

  ArtistEditwork({
    super.key,
    required this.type,
    required this.subtype,
    required this.image,
    required this.description,
    required this.price,
    required this.id,
  });

  final formKey = GlobalKey<FormState>();
  
  get label => null; // Form key for validation

  @override
  Widget build(BuildContext context) {
    pricecontroller.text = price;
    descriptioncontroller.text = description;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Work"),
        backgroundColor: Colors.teal, // Consistent app bar color
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Form(
        key: formKey, // Add the form key here
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Display image
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Card(
                      elevation: 5,
                      child: Container(
                        height: 150,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.cover,
                          ),
                          color: const Color(0xFFE1BEE7), // Light purple background for image
                          border: Border.all(color: Colors.black12),
                        ),
                      ),
                    ),
                  ),
                ),
                // Display work name
                _infoContainer(label: "Work: $type"),
                // Display subtype
                _infoContainer(label: "Subtype: $subtype"),
                // Editable field: Price
                _editableField(
                  controller: pricecontroller,
                  hintText: "Price",
                ),
                // Editable field: Description
                _editableField(
                  controller: descriptioncontroller,
                  hintText: "Description",
                  maxLines: 3,
                ),
                // Update button
                Center(
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200], // Light purple background for button
                    ),
                    child: Center(
                      child: Consumer<Artistprovider>(
                        builder: (context, value, child) => TextButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              // Update work details
                              Map<String, dynamic> data = {
                                "price": pricecontroller.text,
                                "description": descriptioncontroller.text,
                              };
                              await value.editworkfunction(data, id);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            "Update",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable container for displaying static info like type and subtype
  Widget _infoContainer({required String label}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(elevation: 7,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(7),
                          // Consistent with the light purple color
         // Consistent with specified color
          ),
          child: Row(
            children: [
              Text(
                label,
                // style: TextStyle(
                //   color: Color(0xFF6200EA),
                //   fontSize: 16,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable text field for price and description
  Widget _editableField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,

  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(elevation: 7,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(31, 238, 232, 232)),
            borderRadius: BorderRadius.circular(7),
                      // Consistent with the light purple color
        // Consistent background color
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "$hintText is required";
              }
              return null;
            },
            maxLines: maxLines,
            decoration: InputDecoration(
             
             
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xFF6200EA)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 236, 231, 237)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCE93D8)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
