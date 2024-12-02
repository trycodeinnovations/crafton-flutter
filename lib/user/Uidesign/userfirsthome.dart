// import 'package:crafton/provider/artistprovider.dart';
// import 'package:crafton/provider/customerprovider.dart';
// import 'package:crafton/provider/customerprovider.dart';
// import 'package:crafton/provider/customerprovider.dart';
// import 'package:crafton/provider/customerprovider.dart';
// import 'package:crafton/provider/customerprovider.dart';
// import 'package:crafton/user/Uidesign/complaintlist.dart';
// import 'package:crafton/user/Uidesign/orderhistorylist.dart';
// import 'package:crafton/user/Uidesign/viewartistbyalbums.dart';
// import 'package:crafton/user/Uidesign/viewartistbyframes.dart';
// import 'package:crafton/user/Uidesign/viewlistofothers.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../provider/customerprovider.dart';

// class Userfirstpage extends StatelessWidget {
//   const Userfirstpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
        
//         title: Text('Explore Artworks'),
//         backgroundColor: Colors.teal,
//          actions: [
//     Consumer<Customerprovider>(builder: (context, value, child) => 
//        IconButton(
//         icon: Icon(Icons.report_problem), 
//         onPressed: () async{
//          await value.customergetcomplainfunction();
//              Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => ComplaintListPage(),
//                   ));
        
//         },
//       ),
//     ),
//   ],
        
        
//       ),
//       drawer: Drawer( width: 230,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             children: [
//               DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.teal,),
//                 child: Center(
//                   child: Text(
//                     "Artist Menu",
//                     style: TextStyle(fontSize: 22, color: Colors.white),
//                   ),
//                 ),
//               ),
//              Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: ListTile(
//         leading: Icon(Icons.person, color: Colors.black54),
//         title: Text( "Profile", style: TextStyle(fontSize: 16)),
//         trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
//        onTap: () =>  Navigator.pushNamed(context, "customerprofile"),
//         // tileColor: color,
//       ),
//     ),
//        Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Consumer<Customerprovider>(builder: (context, value, child) => 
//        ListTile(
//           leading: Icon(Icons.history, color: Colors.black54),
//           title: Text( "Order history", style: TextStyle(fontSize: 15)),
          
//           trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
//          onTap: () async{
//         await value.customergetorderfun();
//             Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 UserviewOrderlist(),
//                           ),);}
//           // tileColor: color,
//         ),
//       ),
//     ),   Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: ListTile(
//         leading: Icon(Icons.logout, color: Colors.black54),
//         title: Text( "Logout", style: TextStyle(fontSize: 16)),
//         trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
//         // onTap: onTap,
//         // tileColor: color,
//       ),
//     )
//             ],
//           ),
//         ),),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ListView(
//           children: [
//           // Section for Frames
// Text(
//   "Frames",
//   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
// ),
// SizedBox(height: 10),
// Consumer<Customerprovider>(
//   builder: (context, value, child) {
    
//     ;
//     return SizedBox(
//       height: 160,
//       child: ListView.builder(
        
//         scrollDirection: Axis.horizontal,
//         itemCount: customergetframelist.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Consumer<Customerprovider>(builder: (context, value, child) =>  InkWell(
//                 onTap: () async {
                  
//                   final works = customergetframelist[index];
//                   final worksubtype = customergetworklist
//                       .where((work) => work.subtype == works.subtype)
//                       .toList();
//                       print(worksubtype.length);
//                       print(customerviewartistlist.length);
//               if (worksubtype.isNotEmpty) {
//     // Collect all artists matching the subtype
//     final selectedArtist = customerviewartistlist
//         .where((artist) => worksubtype.any((work) => work.artistid == artist.id))
//         .toList();
//                         print(selectedArtist.length);
//                     if (worksubtype.isNotEmpty) {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               ViewallArtyistbyframes(artistlist: selectedArtist,worklist:worksubtype),
//                         ),
//                       );
//                     }
//                   }
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 100,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           borderRadius: BorderRadius.circular(10),
//                           color: const Color.fromARGB(31, 186, 43, 43),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.network(
//                             customergetframelist[index].image ?? '',
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) =>
//                                 Icon(Icons.broken_image, size: 50),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Flexible(
//                         child: Text(
//                           customergetframelist[index].subtype ?? '',
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   },
// ),

//             // Section for Albums
//             SizedBox(height: 20),
//             Text(
//               "Album",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
//             ),
//             SizedBox(height: 10),
//             Container(
//               height: 160,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: customergetalbumlist.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: InkWell(
//                       onTap: () {
//                           final works = customergetalbumlist[index];
//                   final worksubtype = customergetworklist
//                       .where((work) => work.subtype == works.subtype)
//                       .toList();
//                       print(worksubtype.length);
//                       print(customerviewartistlist.length);
//               if (worksubtype.isNotEmpty) {
//     // Collect all artists matching the subtype
//     final selectedArtist = customerviewartistlist
//         .where((artist) => worksubtype.any((work) => work.artistid == artist.id))
//         .toList();
//                         print(selectedArtist.length);
//                     if (worksubtype.isNotEmpty) {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               ViewallArtyistbyframes(artistlist: selectedArtist,worklist:worksubtype),
//                         ),
//                       );
//                     }
//                   }
//                 },
                     
                   
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 100,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 border: Border.all(),
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: const Color.fromARGB(31, 186, 43, 43),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.network(
//                                   customergetalbumlist[index].image,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 5),
//                             Flexible(
//                               child: Text(
//                                 customergetalbumlist[index].subtype,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(fontSize: 14),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),

//             // Section for Others
//             SizedBox(height: 20),
//             Text(
//               "Others",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
//             ),
//             SizedBox(height: 10),
//             Container(
//               height: 160,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: customergetotherlist.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: InkWell(
//                       onTap: () {
//                         final works = customergetotherlist[index];
//                   final worksubtype = customergetworklist
//                       .where((work) => work.subtype == works.subtype)
//                       .toList();
//                       print(worksubtype.length);
//                       print(customerviewartistlist.length);
//               if (worksubtype.isNotEmpty) {
//     // Collect all artists matching the subtype
//     final selectedArtist = customerviewartistlist
//         .where((artist) => worksubtype.any((work) => work.artistid == artist.id))
//         .toList();
//                         print(selectedArtist.length);
//                     if (worksubtype.isNotEmpty) {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               ViewallArtyistbyframes(artistlist: selectedArtist,worklist:worksubtype),
//                         ),
//                       );
//                     }
//                   }
//                 },
                     
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 100,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 border: Border.all(),
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: const Color.fromARGB(31, 186, 43, 43),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.network(
//                                   customergetotherlist[index].image,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 5),
//                             Flexible(
//                               child: Text(
//                                 customergetotherlist[index].subtype,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(fontSize: 14),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
