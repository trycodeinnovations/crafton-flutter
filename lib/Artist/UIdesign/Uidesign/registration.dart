import 'package:crafton/Artist/UIdesign/fuctions/artistregistrationfun.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Added for launching URLs

class ArtistRegistration extends StatelessWidget {
  ArtistRegistration({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController post = TextEditingController();
  TextEditingController socialmeadia = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController confirmpassword = TextEditingController(); // Added controller for confirm password

  bool obscureText = true;
  final formkey = GlobalKey<FormState>(); // Defined the form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Registration",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formkey,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                    image: AssetImage('assets/images/login.jpg'),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        label: const Text("Name"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: phonenumber,
                    decoration: InputDecoration(
                        label: const Text("Phone number"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (value.length != 10) {
                        return "Phone number must contain exactly 10 digits";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: place,
                    decoration: InputDecoration(
                        label: const Text("Place"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (!isValidEmail(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    controller: landmark,
                    decoration: InputDecoration(
                        label: const Text("Landmark"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: district,
                    decoration: InputDecoration(
                        label: const Text("District"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: post,
                    decoration: InputDecoration(
                        label: const Text("Post"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        label: const Text("Email"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (!isValidEmail(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: socialmeadia,
                    decoration: InputDecoration(
                        label: const Text("Social Media Account (Work)"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (!isValidURL(value)) {
                        return "Please enter a valid URL (e.g., https://www.instagram.com/username)";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     final url = socialmeadia.text;
                  //     if (url.isNotEmpty
                      //  && isValidURL(url)
                  //      ) {
                  //       // _launchURL(url);
                  //     } else {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           content: Text("Invalid URL! Please enter a valid link."),
                  //         ),
                  //       );
                  //     }
                  //   },
                  //   // child: Text("Test Social Media Link"),
                  // ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        label: const Text("Password"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    obscureText: obscureText,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: confirmpassword,
                    decoration: InputDecoration(
                        label: const Text("Confirm Password"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
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
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 193, 163, 205)),
                      child: Center(
                        child: TextButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                String status = "pending";
                                Map<String, dynamic> data = {
                                  "name": name.text,
                                  "phonenumber": phonenumber.text,
                                  "district": district.text,
                                  "place": place.text,
                                  "post": post.text,
                                  "socialmedia": socialmeadia.text,
                                  "landmark": landmark.text,
                                  "email": email.text,
                                  "password": password.text,
                                  "status": status
                                };
                                register(data);
                              }
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            )),
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
                              style: TextStyle(
                                  color: Color.fromARGB(255, 193, 163, 205)),
                            )),
                      )
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

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidURL(String url) {
    final RegExp urlRegex = RegExp(
        r'^(https?:\/\/)?(www\.)?[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}\/?[^\s]*$');
    return urlRegex.hasMatch(url);
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
