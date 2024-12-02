import 'package:crafton/UIdesigns/loginfun.dart';
import 'package:crafton/provider/customerprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddComplaintPage extends StatelessWidget {
  const AddComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController complaintController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Complaint'),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Complaint Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Complaint title cannot be empty";
                  }
                  return null;
                },
                controller: complaintController,
                decoration: const InputDecoration(
                  hintText: 'Enter complaint title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Complaint Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Complaint description cannot be empty";
                  }
                  return null;
                },
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter complaint description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              Center(
                child: Consumer<Customerprovider>(
                  builder: (context, value, child) => ElevatedButton(
                    onPressed: () async{
                      if (formKey.currentState!.validate()) {
                        String reply = 'pending';

                        Map<String, dynamic> data = {
                          "reply": reply,
                          'senderID': customerid,
                          'title': complaintController.text.trim(),
                          'complaint': descriptionController.text.trim(),
                        };
                       await value.customeraddcomplaintfun(data);
                       await value.customergetcomplainfunction();

                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    child: const Text('Submit Complaint'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
