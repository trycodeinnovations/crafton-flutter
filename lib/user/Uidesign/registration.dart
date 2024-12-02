import 'dart:io';
import 'package:crafton/user/Uidesign/functions.dart/userregistrationfun.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  TextEditingController name = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController post = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  XFile? pickedimage;
  final ImagePicker _picker = ImagePicker();

  bool obscureText = true;

  final formkey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@gmail\.com$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Registration", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formkey,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(image: AssetImage('assets/images/login.jpg'), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    controller: name,
                    decoration: InputDecoration(
                      label: const Text("Name"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    controller: place,
                    decoration: InputDecoration(
                      label: const Text("Place"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    controller: district,
                    decoration: InputDecoration(
                      label: const Text("District"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    controller: post,
                    decoration: InputDecoration(
                      label: const Text("Post"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    controller: age,
                    decoration: InputDecoration(
                      label: const Text("Age"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (!isValidEmail(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    controller: email,
                    decoration: InputDecoration(
                      label: const Text("Email"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (value.length != 10) {
                        return "Phone number must contain 10 characters";
                      }
                      return null;
                    },
                    controller: phonenumber,
                    decoration: InputDecoration(
                      label: const Text("Phone number"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    obscureText: obscureText,
                    controller: password,
                    decoration: InputDecoration(
                      label: const Text("Password"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (value != password.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    obscureText: obscureText,
                    controller: confirmpassword,
                    decoration: InputDecoration(
                      label: const Text("Confirm Password"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black54), borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        onPressed: () async {
                          XFile? img = await _picker.pickImage(source: ImageSource.gallery);
                          pickedimage = img;
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                        child: const Text("Choose an image"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 193, 163, 205),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () async {
                            if (formkey.currentState?.validate() ?? false) {
                              if (pickedimage != null) {
                                final storageRef = FirebaseStorage.instance.ref().child('employee_images').child('${pickedimage!.name}.jpg');
                                await storageRef.putFile(File(pickedimage!.path));
                                final imageUrl = await storageRef.getDownloadURL();

                                Map<String, dynamic> data = {
                                  "name": name.text,
                                  "district": district.text,
                                  "place": place.text,
                                  "post": post.text,
                                  "age": age.text,
                                  "email": email.text,
                                  "password": password.text,
                                  "phonenumber": phonenumber.text,
                                  "image": imageUrl,
                                };

                                userregisteration(data);
                              }
                            }
                          },
                          child: const Text("Register", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Center(child: Text("Already have an account?")),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Login Now",
                            style: TextStyle(color: Color.fromARGB(255, 193, 163, 205)),
                          ),
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
}
