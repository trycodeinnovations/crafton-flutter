import 'package:crafton/Artist/UIdesign/fuctions/artistgetprofilefun.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Artisteditprofile extends StatelessWidget {
  final String name;
  final String phone;
  final String place;
  final String post;
  final String landmark;
  final String district;
  final String id;
  
   Artisteditprofile({super.key, required this.name, required this.phone, required this.place, required this.post, required this.landmark, required this.district, required this.id});
  TextEditingController namecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController placecontroller=TextEditingController();
  TextEditingController postcontroller=TextEditingController();
  TextEditingController landmarkcontroller=TextEditingController();
  TextEditingController districtcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    namecontroller.text=name;
    phonecontroller.text=phone;
    placecontroller.text=place;
    postcontroller.text=post;
    landmarkcontroller.text=landmark;
    districtcontroller.text=district;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Text(
                          artistprofilelist.first.name.substring(0, 1),
                          style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w600,color: Colors.teal),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        artistprofilelist.first.name,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 5,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
            borderRadius: BorderRadius.circular(7),
           
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: namecontroller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "name",
                labelStyle: TextStyle(color: Colors.black26),
                 hintText: 'Enter text here',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          
        ),
      ),
    ),Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 5,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
            borderRadius: BorderRadius.circular(7),
          
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: phonecontroller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                 hintText: 'Phonenumber',
              ),
            ),
          ),
        ),
      ),
    ),Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 5,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
            borderRadius: BorderRadius.circular(7),
            
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              
              controller: placecontroller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                // hintText: 'Enter text here',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ),
    ),Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 5,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
            borderRadius: BorderRadius.circular(7),
            
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: postcontroller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                // hintText: 'Enter text here',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ),
    ),Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 5,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
            borderRadius: BorderRadius.circular(7),
           
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: landmarkcontroller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                // hintText: 'Enter text here',
                hintStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      ),
    )
    ,Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 5,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
            borderRadius: BorderRadius.circular(7),
            
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: districtcontroller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                // hintText: 'Enter text here',
              ),
            ),
          ),
        ),
      ),
    ),
    Consumer<Artistprovider>(builder: (context, value, child) => 
    ElevatedButton(onPressed: () async{
          Map<String, dynamic> data = {
      
                                  "name": namecontroller.text,
                                  "phonenumber":phonecontroller.text,
                                  "district": districtcontroller.text,
                                  "place": placecontroller.text,
                                  "post": postcontroller.text,
                                  "landmark": landmarkcontroller.text,
                                  
                                };
                                value.artisteditprofilefunction(data,id);
                                await artistprofilegetfun();
                                Navigator.pushNamed(context, "artistprofile");
  
                                
                                
        
      }, child: const Text("Edit")),
    )
            ],
          ),
        ),
      ),
    );
  }

}
