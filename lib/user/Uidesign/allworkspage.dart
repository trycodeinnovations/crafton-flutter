// import 'package:crafton/user/Uidesign/workfulldetai.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:crafton/provider/customerprovider.dart';

// class Allworkpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Gallery', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: Consumer<Customerprovider>(
//         builder: (context, provider, child) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//                 childAspectRatio: 1,
//               ),
//               itemCount: provider.filteredWorkList.length,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () =>  Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => WorkFullDetails(
//                             work:provider.filteredWorkList[index]


//                           ),
//                         )),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 8,
//                           offset: Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(15),
//                       child: Stack(
//                         children: [
//                           Image.network(
//                             provider.filteredWorkList[index].image,
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             height: double.infinity,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [Colors.black45, Colors.transparent],
//                                 begin: Alignment.bottomCenter,
//                                 end: Alignment.topCenter,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 10,
//                             left: 10,
//                             right: 10,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   provider.filteredWorkList[index].subtype,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
