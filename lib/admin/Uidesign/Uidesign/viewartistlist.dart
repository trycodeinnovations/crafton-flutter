import 'package:crafton/admin/Uidesign/Uidesign/approvedartistlist.dart';
import 'package:crafton/admin/Uidesign/Uidesign/artistlist.dart';
import 'package:crafton/admin/Uidesign/Uidesign/complaints.dart';
import 'package:crafton/provider/adminprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminArtistActions extends StatelessWidget {
  const AdminArtistActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Management",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      // Updated Drawer design
     drawer: Drawer(
  width: 230,
  child: Container(
    decoration: const BoxDecoration(
      
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
             color: Colors.teal
            ),
            child: Center(
              child: Text(
                "Admin Menu",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          _drawerCard(
            context: context,
            icon: Icons.person,
            text: "Profile",
            onTap: () => Navigator.pushNamed(context, "profile"),
            color: const Color.fromARGB(255, 248, 246, 250),
            // textColor: Colors.deepPurple[800],
          ),
          Consumer<Adminprovider>(builder: (context, value, child) => 
             _drawerCard(
              context: context,
              icon: Icons.report_problem,
              text: "Complaints",
              onTap: () {
                value.admingetcomplaintfunction();
                   Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Complaints(
                        
                      ),
                    ));
                // Add settings functionality if needed
              },
              // color: Colors.blue[50],
              // textColor: Colors.blue[800],
            ),
          ),
          _drawerCard(
            context: context,
            icon: Icons.logout,
            text: "Logout",
            onTap: () {
              Navigator.pushNamed(context, "firstscreen");
              // Add logout functionality if needed
            },
            color: Colors.red[50],
            // textColor: Colors.red[800],
          ),
        ],
      ),
    ),
  ),
),

      body: Container(
        decoration: const BoxDecoration(
       
        ),
        padding: const EdgeInsets.all(20.0),
        child: Consumer<Adminprovider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await value.getartistfun();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdminviewpendingArtistlist(
                      pendinglist: value.artistwaitinglist,
                    ),
                  ));
                },
                style: ElevatedButton.styleFrom(
                
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pending, color: Colors.black54),
                    SizedBox(width: 10),
                    Text(
                      "Pending artists",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color:Colors.black54 ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Card(elevation: 5,
                child: ElevatedButton(
                  onPressed: () async {
                    await value.getartistfun();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AdminviewapprovedArtistlist(
                        approvedlist: value.artistapprovedlist,
                      ),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    
                    
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, color: Colors.black54),
                      SizedBox(width: 10),
                      Text(
                        "Approved Artists",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom drawer card function for consistent design
  Widget _drawerCard({
    required BuildContext context,
    required IconData icon,
    required String text,
    required VoidCallback onTap, Color? color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black54),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
           
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
        onTap: onTap,
      ),
    );
  }
}
