import 'package:flutter/material.dart';

class Viewlistofothers extends StatelessWidget {
  const Viewlistofothers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Others"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0.1,
            crossAxisSpacing: 0.1,
            childAspectRatio: .9),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(31, 107, 105, 105),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.black12),
                      width: 300,
                    ),
                  ),
                  const Text("Name"),
                  const Text("Price")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
