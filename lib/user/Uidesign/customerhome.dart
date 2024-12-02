import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/user/Uidesign/albumwork.dart';
import 'package:crafton/user/Uidesign/complaintlist.dart';
import 'package:crafton/user/Uidesign/framework.dart';
import 'package:crafton/user/Uidesign/otherwork.dart';
import 'package:crafton/user/Uidesign/workfulldetai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerHomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  CustomerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.teal,
          title: const Text("Customer Home"),
          actions: [
    Consumer<Customerprovider>(builder: (context, value, child) => 
       IconButton(
        icon: const Icon(Icons.report_problem), 
        onPressed: () async{
         await value.customergetcomplainfunction();
             Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ComplaintListPage(),
                  ));
        
        },
      ),
    ),
  ],
        ),
        drawer: Drawer(
          width: 230,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.teal),
                  child: Center(
                    child: Text(
                      "Artist Menu",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.black54),
                    title: const Text("Profile", style: TextStyle(fontSize: 16)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
                    onTap: () => Navigator.pushNamed(context, "customerprofile"),
                  ),
                ),
                // Card(
                //   elevation: 4,
                //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                //   child: Consumer<Customerprovider>(
                //     builder: (context, value, child) => ListTile(
                //       leading: Icon(Icons.history, color: Colors.black54),
                //       title: Text("Order history", style: TextStyle(fontSize: 15)),
                //       trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
                //       onTap: () async {
                //         await value.customergetorderfun();
                //         Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => UserviewOrderlist(),
                //         ));
                //       },
                //     ),
                //   ),
                // ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: const Icon(Icons.logout, color: Colors.black54),
                    title: const Text("Logout", style: TextStyle(fontSize: 16)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
                    onTap: () {
                       Navigator.pushNamed(context, "firstscreen");
                      
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  Provider.of<Customerprovider>(context, listen: false).filterWorks(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            // TabBar
            Container(
              color: Colors.grey[200], // Background for the TabBar
              child: const TabBar(
                indicatorColor: Colors.teal,
                labelColor: Colors.teal,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  Tab( text: "All Works"),
                  Tab( text: "Frames"),
                  Tab( text: "Albums"),
                  Tab( text: "Others"),
                ],
              ),
            ),
            // TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  // First tab (current body content)
                  Consumer<Customerprovider>(
                    builder: (context, provider, child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 1,
                          ),
                          itemCount: provider.filteredWorkList.length,
                          itemBuilder: (context, index) {
                            return InkWell(

                              onTap: () {
                           
      final works = provider.filteredWorkList[index];
      
         final selectedArtist = customerviewartistlist
                  .where((work) => work.id == works.artistid)
                  .toList();
                  print(works.id);
                  print(selectedArtist.length);
                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => WorkFullDetails(
                                  work: provider.filteredWorkList[index],artist:selectedArtist
                                ),
                              ));




                              },
                            
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        provider.filteredWorkList[index].image,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Colors.black45, Colors.transparent],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        left: 10,
                                        right: 10,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              provider.filteredWorkList[index].subtype,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  // Second tab
                  const Allframes(),
                  // Third tab
                  const Allalbums(),
                  // Fourth tab
                  const Otherwork(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
