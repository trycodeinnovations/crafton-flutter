import 'package:crafton/user/Uidesign/functions.dart/customergetprofilefun.dart';
import 'package:crafton/user/Uidesign/usereditprofile.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor:  Colors.teal,
        foregroundColor: Colors.black, // Set AppBar text color to black
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView( // Changed to ListView for better overflow handling
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditUserProfile(
                              name:customerprofilelist.first.name,phone:customerprofilelist.first.phonenumber,place:customerprofilelist.first.place,post:customerprofilelist.first.post,age:customerprofilelist.first.age,district:customerprofilelist.first.district,id:customerprofilelist.first.id
                       
                               ),
                        ),
                      );
                  
                }, icon: const Icon(Icons.edit)),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[300], 
                      child: Text(customerprofilelist.first.name.substring(0,1),style: const TextStyle(fontSize: 28,fontWeight: FontWeight.w700),),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      customerprofilelist.first.name,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black), // Set text color to black
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildProfileInfoContainer(customerprofilelist.first.name),
            const SizedBox(height: 20),
            _buildProfileInfoContainer(customerprofilelist.first.phonenumber),
            const SizedBox(height: 20),
         
            _buildProfileInfoContainer(customerprofilelist.first.age),
              const SizedBox(height: 20),
            _buildProfileInfoContainer(customerprofilelist.first.place),
          
            const SizedBox(height: 20),
            _buildProfileInfoContainer(customerprofilelist.first.post),
          
          
            
            const SizedBox(height: 20),
            _buildProfileInfoContainer(customerprofilelist.first.district),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoContainer(String text) {
    return Card(
      elevation: 5,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
          borderRadius: BorderRadius.circular(7),
         
        ),
        child: Center( // Center the text in the container
          child: Text(
            text,
            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500), // Set text color to black
          ),
        ),
      ),
    );
  }
}
