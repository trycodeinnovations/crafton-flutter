import 'package:crafton/Artist/UIdesign/Uidesign/editprofile.dart';
import 'package:crafton/Artist/UIdesign/fuctions/artistgetprofilefun.dart';
import 'package:flutter/material.dart';

class Artistprofile extends StatelessWidget {
  const Artistprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor:Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Artisteditprofile(
                            name:artistprofilelist.first.name,phone:artistprofilelist.first.phonenumber,place:artistprofilelist.first.place,post:artistprofilelist.first.post,landmark:artistprofilelist.first.landmark,district:artistprofilelist.first.district,id:artistprofilelist.first.id
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  Column(
                    children: [
                      CircleAvatar(backgroundColor: Colors.teal[100],
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
              ..._buildProfileCards(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildProfileCards() {
    return [
      _buildCard(artistprofilelist.first.name),
      _buildCard(artistprofilelist.first.phonenumber),
      _buildCard(artistprofilelist.first.place),
      _buildCard(artistprofilelist.first.post),
      _buildCard(artistprofilelist.first.landmark),
      _buildCard(artistprofilelist.first.district),
    ];
  }

  Widget _buildCard(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 9,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
            borderRadius: BorderRadius.circular(7),
            ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
