import 'package:crafton/admin/Uidesign/Uidesign/repliedcomplaintpage.dart';
import 'package:crafton/provider/adminprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplaintrepliedListPage extends StatelessWidget {
  const ComplaintrepliedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Replied Complaints',
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
                  itemCount: value.repliedlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(elevation: 7,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                         
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
                                      Text(
                                        value.repliedlist[index].title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                         
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        value.repliedlist[index]
                                            .complaint,
                                            // .substring(0, 9),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewrepliedComplaintPage(
                                      repliedcomplaint:
                                          value.repliedlist[index],
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
