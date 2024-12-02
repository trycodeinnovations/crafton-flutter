// import 'package:crafton/models/customergetallartist.dart';
// import 'package:crafton/models/customergetworklistmodel.dart';
// import 'package:crafton/user/Uidesign/orderpage.dart';
// import 'package:flutter/material.dart';

// class ViewallArtyistbyframes extends StatelessWidget {
//   const ViewallArtyistbyframes({
//     super.key,
//     required this.artistlist,
//     required this.worklist,
//   });

//   final List<Customergetallartistmodel> artistlist;
//   final List<Customergetworkmodel> worklist;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Works"),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 12,
//             crossAxisSpacing: 12,
//             childAspectRatio: .6,
//           ),
//           itemCount: artistlist.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       // onTap: () => Navigator.of(context).push(
//                       //   MaterialPageRoute(
//                       //     builder: (context) => OrderPage(
//                       //       workss: worklist[index],
//                       //     ),
//                       //   ),
//                       // ),
//                       child: Container(
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
//                             worklist[index].image ?? '',
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) =>
//                                 Icon(Icons.broken_image, size: 50),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Flexible(
//                     child: Text(
//                       artistlist[index].name ?? '',
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   Flexible(
//                     child: Text(
//                       artistlist[index].place ?? '',
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: TextStyle(fontSize: 12, color: Colors.black54),
//                     ),
//                   ),
//                     Flexible(
//                     child: Text(
//                       artistlist[index].phonenumber ?? '',
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: TextStyle(fontSize: 12, color: Colors.black54),
//                     ),
//                   ),
//                   Flexible(
//                     child: Text(
//                       worklist[index].subtype ?? '',
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: TextStyle(fontSize: 12, color: Colors.black54),
//                     ),
//                   ),
//                   Flexible(
//                     child: Text(
//                       '₹${worklist[index].price}',
//                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
