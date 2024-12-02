import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/user/Uidesign/addcomplaintpage.dart';
import 'package:crafton/user/Uidesign/viewcomplaintpage.dart';
import 'package:flutter/material.dart';

class ComplaintListPage extends StatelessWidget {
  const ComplaintListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Expanded widget makes the ListView take up remaining space
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(customerviewcomplaintlist[index].title),
                      subtitle: Text(customerviewcomplaintlist[index].complaint
                      // .substring(0,9)
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewComplaintPage(complaintlist:customerviewcomplaintlist[index]),
                        ));
                      },
                    ),
                  );
                },
              ),
            ),
            // "Add Complaint" button placed at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddComplaintPage(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: const Size(double.infinity, 50), // Make the button span full width
                ),
                child: const Text('Add Complaint'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
