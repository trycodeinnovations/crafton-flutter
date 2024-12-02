import 'package:crafton/models/customermodel.dart';
import 'package:flutter/material.dart';

class AdminViewuserdetails extends StatelessWidget {
  final Customermodel user;
  const AdminViewuserdetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Container(
        decoration: const BoxDecoration(
        
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture and name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
  backgroundImage: NetworkImage(user.image), 
                      radius: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Details section (name, place, post, district, age)
            _buildDetailItem("Name", user.name),
            const SizedBox(height: 15),
            _buildDetailItem("Place", user.place),
            const SizedBox(height: 15),
            _buildDetailItem("Post", user.post),
            const SizedBox(height: 15),
            _buildDetailItem("District", user.district),
            const SizedBox(height: 15),
            _buildDetailItem("Age", user.age),
          ],
        ),
      ),
    );
  }

  // Helper method to build the detail containers
  Widget _buildDetailItem(String label, String value) {
    return Card(elevation: 7,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
          borderRadius: BorderRadius.circular(10),
         
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
             
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
