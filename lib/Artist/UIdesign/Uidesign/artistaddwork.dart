import 'dart:io';
import 'package:crafton/Artist/UIdesign/fuctions/addworkfun.dart';
import 'package:crafton/Artist/UIdesign/fuctions/workimageaddfun.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:crafton/admin/Uidesign/Uidesign/homescreen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ArtistAddwork extends StatelessWidget {
  final TextEditingController nameofthework = TextEditingController();
  final TextEditingController subtype = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();

  ArtistAddwork({super.key});

  XFile? pickedImage;
  final ImagePicker _picker = ImagePicker();
  List<XFile> images = [];
  List<String> urls = [];
  final formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: const Center(child: Text("Add Work")),
        backgroundColor: Colors.teal, // Purple app bar
        foregroundColor: Colors.white,
      
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Card(
                    child: Container(
                      height: 150,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/ring.jpeg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _buildImagePickerButton(context),
              _buildDropdowns(context),
              _buildTextField(price, "Price"),
              _buildTextField(description, "Description"),
              _buildAddButton(context),
            ]),
          ),
        ),
      ),
    );
  }

  // Function to build the image picker button
  Widget _buildImagePickerButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(elevation: 8,
        child: Container(
          height: 50,
          decoration: _boxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  XFile? img = await _picker.pickImage(source: ImageSource.gallery);
                  pickedImage = img;
                },
                child: const Text(
                  "Pick an image",
                  style: TextStyle(color: Colors.black), // Black text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build dropdowns for category and subcategory
  Widget _buildDropdowns(BuildContext context) {
    return Consumer<Artistprovider>(
      builder: (context, dropdownState, child) {
        return Column(
          children: [
            _buildDropdown(
              dropdownState.category,
              dropdownState.selectedCategory,
              "Select category",
              (value) => dropdownState.updateCategory(value),
            ),
            if (dropdownState.subcategory.isNotEmpty)
              _buildDropdown(
                dropdownState.subcategory,
                dropdownState.selectedSubcategory,
                "Select subcategory",
                (value) => dropdownState.updateSubcategory(value),
              ),
          ],
        );
      },
    );
  }

  // Function to build individual dropdown widget
  Widget _buildDropdown(
    List<String> items,
    String? selectedValue,
    String hint,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(elevation: 8,
        child: Container(
          decoration: _boxDecoration(),
          width: double.infinity,
          child: DropdownButton<String>(
            value: selectedValue,
            hint: Text(hint),
            items: items.map((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  // Function to build text fields for price and description
  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(elevation: 8,
        child: Container(
          decoration: _boxDecoration(),
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "$hintText is required";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black), // Black hint text
            
            ),
          ),
        ),
      ),
    );
  }

  // Function to build the add button
  Widget _buildAddButton(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.teal, // Purple background for the button
        ),
        child: Consumer<Artistprovider>(
          builder: (context, provider, child) => TextButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                // Custom category & subcategory validation
                if (provider.selectedCategory == null) {
                  _showSnackBar(context, "Please select a category");
                  return;
                }
                if (provider.selectedSubcategory == null && provider.subcategory.isNotEmpty) {
                  _showSnackBar(context, "Please select a subcategory");
                  return;
                }

                if (pickedImage == null) {
                  _showSnackBar(context, "Please pick an image");
                  return;
                }

                // Proceed with uploading and data handling
                for (XFile img in images) {
                  String url = await addpreviousworkimage(img);
                  urls.add(url);
                }

                final storageref = FirebaseStorage.instance
                    .ref()
                    .child('work_images')
                    .child('${pickedImage!.name}.jpg');
                await storageref.putFile(File(pickedImage!.path));

                final imageUrl = await storageref.getDownloadURL();
                final data = {
                  "artistid": artistid,
                  "nameofthework": provider.selectedCategory,
                  "subtype": provider.selectedSubcategory,
                  "price": price.text,
                  "description": description.text,
                  "image": imageUrl,
                };

                await Artistaddworkfun(data,context);
                provider.getworkfun();
                Navigator.pushNamed(context, "artisthome", arguments: current = ValueNotifier(1));
              }
            },
            child: const Text(
              "Add",
              style: TextStyle(color: Colors.white), // White text for the button
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for consistent container decoration
  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      border: Border.all(color: const Color.fromARGB(31, 252, 249, 249)),
      borderRadius: BorderRadius.circular(7),
     // White background for input fields and buttons
    );
  }

  // Helper method for displaying snackbar messages
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red, // Red background for snackbars
      ),
    );
  }
}
