import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/user/Uidesign/workfulldetai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Allalbums extends StatelessWidget {
  const Allalbums({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Consumer<Customerprovider>(
                    builder: (context, provider, child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 1,
                          ),
                          itemCount: provider.filteredalbumList.length,
                          itemBuilder: (context, index) {
                            return InkWell(

                              onTap: () {
                           
      final works = provider.filteredalbumList[index];
      //  final selectedArtist = customerviewartistlist
      //   .where((artist) => artist.any((work) => work.artistid == artist.id))
      //   .toList();
         final selectedArtist = customerviewartistlist
                  .where((work) => work.id == works.artistid)
                  .toList();
                  print(works.id);
                  print(selectedArtist.length);
                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => WorkFullDetails(
                                  work: provider.filteredalbumList[index],artist:selectedArtist
                                ),
                              ));




                              },
                              // onTap: () => Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => WorkFullDetails(
                              //     work: provider.filteredWorkList[index],
                              //   ),
                              // )),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        provider.filteredalbumList[index].image,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Colors.black45, Colors.transparent],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        left: 10,
                                        right: 10,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              provider.filteredalbumList[index].subtype,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),

    );
  }
}