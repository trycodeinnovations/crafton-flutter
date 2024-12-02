import 'package:crafton/Artist/UIdesign/Uidesign/artistviewfullworkdetails.dart';
import 'package:crafton/Artist/UIdesign/fuctions/getworklistfun.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Artistworklist extends StatelessWidget {
  const Artistworklist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("List of Works",style: TextStyle(color: Colors.white),),),
        backgroundColor: Colors.teal, // Keep the app bar color consistent
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<Artistprovider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.artistworklist.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(elevation: 8,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      leading: const CircleAvatar(
                        // Use a consistent shade of purple
                        child: Icon(Icons.work, color: Colors.white),
                      ),
                      title: Text(
                        value.artistworklist[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(value.artistworklist[index].subtype),
                          Text("₹: ${value.artistworklist[index].price}"),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,color: Colors.teal,),
                     // Matching light purple from previous UI
                      onTap: () {
                        getworklistfunction();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Viewworkdetails(
                              artistwork: value.artistworklist[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
