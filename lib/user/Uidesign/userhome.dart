import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/user/Uidesign/customerhome.dart';
import 'package:crafton/user/Uidesign/offerlist.dart';
import 'package:crafton/user/Uidesign/orderhistorylist.dart';
import 'package:crafton/user/Uidesign/userviewallartist1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ValueNotifier<int> current = ValueNotifier(0);

class Userhomescreen extends StatelessWidget {
  Userhomescreen({super.key});

  List<Widget> screen = [
    CustomerHomePage(),
    const Userviewallartist1(),
    const Offerpage(),
    const UserviewOrderlist(),
    // OffersPage(), // New Offers Page
    // OrderPage(),  // New Order Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: current,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: "Artists",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                label: "Offers",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Orders",
              ),
            ],
            currentIndex: current.value,
            onTap: (value) async {
              var provider = Provider.of<Customerprovider>(context, listen: false);

              if (value == 0) {
                 
                await provider.customergetworkfun();
                await provider.customergetallartistlistfun();
                await provider.customergetworkbyartistfun();
                await provider.customergetgalleryfunction();
                await provider.customergetofferfunction();
                 await provider.customergetallartistlistfun();
                await provider.customergetworkbyartistfun();
                await provider.customergetgalleryfunction();
                 await provider.customergetofferfunction();
                 await provider.customergetorderfun();
              } else if (value == 1) {
                await provider.customergetallartistlistfun();
                await provider.customergetworkbyartistfun();
                await provider.customergetgalleryfunction();
              }
                 else if (value == 2) {
                  await provider.customergetofferfunction();
               
              } else if (value == 3) {
                await provider.customergetorderfun();
              }

              current.value = value;
            },
            selectedItemColor: Colors.teal,       // Set the color for the selected icon and label
            unselectedItemColor: Colors.black54,  // Set the color for unselected icons and labels
            backgroundColor: Colors.white,        // Set the background color for the BottomNavigationBar
          );
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: current,
        builder: (context, value, child) {
          return screen[current.value];
        },
      ),
    );
  }
}
