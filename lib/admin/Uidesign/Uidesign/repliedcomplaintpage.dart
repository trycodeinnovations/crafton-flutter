import 'package:crafton/models/admingetcomplaintmodel.dart';
import 'package:crafton/provider/adminprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewrepliedComplaintPage extends StatelessWidget {
  final Admingetcomplaintmodel repliedcomplaint;
  ViewrepliedComplaintPage({super.key, required this.repliedcomplaint});
  TextEditingController replycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complaint',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Complaint Title Section
            const Text(
              'Complaint Title',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              
              ),
            ),
            const SizedBox(height: 8),
            Consumer<Adminprovider>(
              builder: (context, value, child) => Card(elevation: 7,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                   
                     
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            repliedcomplaint.title,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Complaint Description Section
            const Text(
              'Complaint Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
             
              ),
            ),
            const SizedBox(height: 8),
            Consumer<Adminprovider>(
              builder: (context, value, child) => Card(elevation: 7,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                   
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                   
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            repliedcomplaint.complaint,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Reply Section
            const Text(
              'Reply',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              
              ),
            ),
            const SizedBox(height: 8),
             Card(elevation: 7,
               child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            repliedcomplaint.reply,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
             ),
           
            const SizedBox(height: 20),

           
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
