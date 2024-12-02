import 'dart:io';

import 'package:crafton/Artist/UIdesign/fuctions/addgalleryfun.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class GalleryPage extends StatelessWidget {
   GalleryPage({super.key});
  XFile? pickedimage;
  final ImagePicker _picker=ImagePicker();
  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Previous Work',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<Artistprovider>(builder: (context, value, child) =>  GridView.builder(
                  itemCount: value.gallerylist.length, // Replace with the number of images
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 9,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                      child: Consumer<Artistprovider>(builder: (context, value, child) => 
                         Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            
                           
                          ),
                          child:
                         
                          
                           Image(image: NetworkImage(value.gallerylist[index].previouwork),fit: BoxFit.fill,),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
            XFile? img = await _picker.pickImage(
                                source: ImageSource.gallery);
                            pickedimage = img;
          // Implement upload functionality
            if (pickedimage != null) {
                                  final storageref = FirebaseStorage.instance
                                      .ref()
                                      .child('work_images')
                                      .child('${pickedimage!.name}.jpg');
                                  await storageref.putFile(File(pickedimage!.path));
                          
                                  final imageUrl =
                                      await storageref.getDownloadURL();
                                           await storageref.getDownloadURL();
                                  Map<String, dynamic> data = {
                                    // "image":
                                    "id":artistid,
                                 
                                    "previouswork":imageUrl
                                  };
                                  await Artistaddgallery(data,context);
                                var provider =Provider.of<Artistprovider>(context,listen: false);
                                await provider.artistgetgalleryfun();
                                  }
        },
        backgroundColor:Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }

  
}
