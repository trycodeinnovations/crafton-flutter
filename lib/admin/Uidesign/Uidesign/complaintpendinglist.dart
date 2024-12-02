import 'package:crafton/admin/Uidesign/Uidesign/pendingcomplaintpage.dart';
import 'package:crafton/provider/adminprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplaintpendingListPage extends StatelessWidget {
  const ComplaintpendingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pending Complaints',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor:  Colors.teal,
                                      
        elevation: 5,
      ),
      body: Container(
        decoration: const BoxDecoration(
         
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: Consumer<Adminprovider>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.complaintpendinglist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          value.complaintpendinglist[index].title,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                           
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          value.complaintpendinglist[index]
                                              .complaint
                                              // .substring(0, 9)
                                              ,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ViewpendingComplaintPage(
                                    pendingcomplaint:
                                        value.complaintpendinglist[index],
                                  ),
                                ));
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
