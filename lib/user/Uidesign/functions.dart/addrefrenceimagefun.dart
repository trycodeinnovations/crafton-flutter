import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future <String> addreferenceimage(image)async{
    final storageref = FirebaseStorage.instance
                                  .ref()
                                  .child('work_images')
                                  .child('${image!.name}.jpg');
                              await storageref.putFile(File(image.path));

                              final imageUrl =
                                  await storageref.getDownloadURL();
                                  return imageUrl;
}