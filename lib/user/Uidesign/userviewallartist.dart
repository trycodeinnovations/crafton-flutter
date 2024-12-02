import 'package:crafton/provider/customerprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Userviewallartist extends StatelessWidget {
  const Userviewallartist({super.key});
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
            
      body: 
        Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<Customerprovider>(builder: (context, value, child) => 
          ListView.builder(
            itemCount: value.customerviewgallerylist.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.black12),color: const Color.fromARGB(255, 243, 191, 232)
                  ),
                  child: 
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(radius: 25,),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(value.customerviewgallerylist[index].artistid),
                              Text(value.customerviewgallerylist[index].id),
                               SizedBox(height: 60,
                               width: 60,
                               child: Image(image: NetworkImage(value.customerviewgallerylist[index].gallery)),)
                             
                            ],
                          ),
                        ),
                      ),
                      IconButton(onPressed: 
                      () {
                        //     Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => Viewartistdetails(
                        //       artistwork: value.artistlist[index],
                        //     ),
                        //   ),
                        // );
                        // Navigator.pushNamed(context, "viewaristpage");
                        
                      }, icon: const Icon(Icons.arrow_forward_ios))
                    ],
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