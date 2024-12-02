import 'package:flutter/material.dart';

class Artisteditwork extends StatelessWidget {
  const Artisteditwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
             
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 200,
                    height: 130,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/ring.jpeg'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.black12),
                        color: Colors.amber),
                  ),
                ],
              ),
            ),
            const Text(
              "Name",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(7),
                      color: const Color.fromARGB(255, 243, 191, 232)),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 243, 191, 232))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 243, 191, 232)))),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.black12),
                    color: const Color.fromARGB(255, 243, 191, 232)),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 191, 232))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 191, 232)))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.black12),
                    color: const Color.fromARGB(255, 243, 191, 232)),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 191, 232))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 191, 232)))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
