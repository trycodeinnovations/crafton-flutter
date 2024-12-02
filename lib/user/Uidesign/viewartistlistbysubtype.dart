// import 'package:crafton/provider/customerprovider.dart';
// import 'package:crafton/user/Uidesign/userviewartistpage.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Userviewallartist1 extends StatelessWidget {
//   const Userviewallartist1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Artists'),
//         backgroundColor: Colors.teal,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Consumer<Customerprovider>(
//           builder: (context, value, child) => ListView.builder(
//             itemCount: customerviewartistlist.length,
//             itemBuilder: (BuildContext context, int index) {
//               final selectedArtist = customerviewartistlist[index];
//               final otherworks = value.customerviewgallerylist
//                   .where((work) => work.artistid == selectedArtist.id)
//                   .toList();
//               final artistWorks = value.customerworkbyartistlist
//                   .where((work) => work.artistid == selectedArtist.id)
//                   .toList();

//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   elevation: 4,
//                   child: Container(
//                     height: 140,
//                     padding: EdgeInsets.all(12),
//                     child: Row(
//                       children: [
//                         // Artist Avatar
//                         CircleAvatar(
//                           radius: 30,
//                           // backgroundImage: NetworkImage(selectedArtist.profileImage), // Assuming profile image exists
//                           backgroundColor: Colors.grey[300],
//                         ),
//                         SizedBox(width: 15),

//                         // Artist Details
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 selectedArtist.name,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 selectedArtist.place,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 selectedArtist.district,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 selectedArtist.landmark,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         // Arrow Icon for Navigation
//                         IconButton(
//                           onPressed: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => Artistpage(
//                                   artist: selectedArtist,
//                                   works: artistWorks,
//                                   otherwork: otherworks,
//                                 ),
//                               ),
//                             );
//                           },
//                           icon: Icon(
//                             Icons.arrow_forward_ios,
//                             color: Colors.teal,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
