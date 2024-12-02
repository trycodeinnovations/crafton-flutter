import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:crafton/provider/customerprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emaill = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "HEY, WELCOME!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: emaill,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: password,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Consumer<Customerprovider>(
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () async {
                    await value.customergetworkfun();
                    login(emaill.text, password.text, context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text("LOGIN"),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Don't have an account?",
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "artistregistration");
                    },
                    child: const Text(
                      "Artist Registration",
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                       var provider = Provider.of<Customerprovider>(context, listen: false);
                      await provider.customergetallartistlistfun();
                      Navigator.pushNamed(context, "userregistration");
                    },
                    child: const Text(
                      "User Registration",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
