import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/user/Uidesign/functions.dart/customergetprofilefun.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUserProfile extends StatelessWidget {
  final String name;
  final String phone;
  final String place;
  final String post;
  final String district;
  final String id;
  final String age;
  
  EditUserProfile({super.key, required this.name, required this.phone, required this.place, required this.post, required this.district, required this.id, required this.age});
  
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController placecontroller = TextEditingController();
  TextEditingController postcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController districtcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    namecontroller.text = name;
    phonecontroller.text = phone;
    placecontroller.text = place;
    postcontroller.text = post;
    agecontroller.text = age;
    districtcontroller.text = district;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        child: Text(
                          customerprofilelist.first.name.substring(0, 1),
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        customerprofilelist.first.name,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: namecontroller,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey[700]),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: phonecontroller,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey[700]),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Phone number cannot be empty";
                        }
                        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return "Enter a valid 10-digit phone number";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: placecontroller,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: 'Place',
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey[700]),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Place cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: postcontroller,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: 'Post',
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey[700]),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Post cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: agecontroller,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: 'Age',
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey[700]),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Age cannot be empty";
                        }
                        if (int.tryParse(value) == null) {
                          return "Enter a valid number";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: districtcontroller,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: 'District',
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey[700]),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "District cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Consumer<Customerprovider>(
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> data = {
                        "name": namecontroller.text,
                        "phonenumber": phonecontroller.text,
                        "district": districtcontroller.text,
                        "place": placecontroller.text,
                        "post": postcontroller.text,
                        "landmark": agecontroller.text,
                      };
                      value.customerprofileeditfunction(data, id);
                      await customerprofilegetfun();
                      Navigator.pushNamed(context, "customerprofile");
                    }
                  },
                  child: const Text("Edit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
