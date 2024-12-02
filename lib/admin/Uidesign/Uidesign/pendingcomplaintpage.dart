import 'package:crafton/models/admingetcomplaintmodel.dart';
import 'package:crafton/provider/adminprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewpendingComplaintPage extends StatelessWidget {
  final Admingetcomplaintmodel pendingcomplaint;
  final TextEditingController replycontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ViewpendingComplaintPage({super.key, required this.pendingcomplaint});

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
        child: Form(
          key: _formKey,
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
                      color: const Color.fromARGB(255, 251, 219, 246),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color.fromARGB(255, 255, 232, 254)),
                    
                       
                    ),
                    child: Row(
                      children: [
                        Text(
                          pendingcomplaint.title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
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
                        Text(
                          pendingcomplaint.complaint,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
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
              TextFormField(
                controller: replycontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Reply cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              Center(
                child: Consumer<Adminprovider>(
                  builder: (context, value, child) => ElevatedButton(
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        Map<String, dynamic> data = {
                          "reply": replycontroller.text,
                        };
                        
                       await value.sendreplyfunction(data, value.complaintpendinglist.first.id,context);
                       await value.admingetcomplaintfunction();
                        Navigator.of(context).pop(); // Go back after submitting
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[400],
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
