import 'dart:io';

import 'package:crafton/Artist/UIdesign/fuctions/artistgetprofilefun.dart';
import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class OfferBrochuresPage extends StatelessWidget {
  OfferBrochuresPage({super.key});

  XFile? pickedimage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Offer Brochures"),
      ),
      body: Consumer<Artistprovider>(
        builder: (context, value, child) {
          return value.artistofferlist.isEmpty
              ? const Center(
                  child: Text(
                    "No brochures available. Add one using the button below!",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: value.artistofferlist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(value.artistofferlist[index].offer),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await value.deleteofferfunction(value.artistofferlist[index].id);
                            // await value.artistdeleteofferfunction(
                            //     value.artistofferlist[index].id, context);
                             await value.artistgetofferfunction();
                          },
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: Consumer<Artistprovider>(
        builder: (context, value, child) => FloatingActionButton(splashColor: Colors.teal,
          onPressed: () async {
            XFile? img = await _picker.pickImage(source: ImageSource.gallery);
            pickedimage = img;

            if (pickedimage != null) {
              final storageRef = FirebaseStorage.instance
                  .ref()
                  .child('employee_images')
                  .child('${pickedimage!.name}.jpg');
              await storageRef.putFile(File(pickedimage!.path));
              final imageUrl = await storageRef.getDownloadURL();

              Map<String, dynamic> data = {
                "artistid": artistid,
                "offer": imageUrl,
                "artistname": artistprofilelist.first.name,
                "artistlandmark": artistprofilelist.first.landmark,
                "phonenumber": artistprofilelist.first.phonenumber
              };
              await value.artistaddofferfunction(data, context);
              await value.artistgetofferfunction();
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
