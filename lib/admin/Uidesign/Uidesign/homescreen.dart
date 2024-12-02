import 'package:crafton/admin/Uidesign/Uidesign/userslist.dart';
import 'package:crafton/admin/Uidesign/Uidesign/viewartistlist.dart';
import 'package:flutter/material.dart';
ValueNotifier<int> current = ValueNotifier(0);


class Adminhomescreen extends StatelessWidget {
   Adminhomescreen({super.key});

  List <Widget>screen=[const AdminArtistActions(),const AdminviewUserlist()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: 
    ValueListenableBuilder(
      valueListenable:  current,
      builder: ( context,  value,  child) {
        return  BottomNavigationBar(
          items: const [
            
            BottomNavigationBarItem(icon:Icon(Icons.person),label: "Artist" ),
            BottomNavigationBarItem(icon:Icon(Icons.person),label: "User" )
          ],
       currentIndex: current.value,
            onTap: (value) {
              current.value = value;
            },
                selectedItemColor: Colors.teal,       // Set the color for the selected icon and label
            unselectedItemColor: Colors.black54,  // Set the color for unselected icons and labels
            backgroundColor: Colors.white,
          
        );
      },
    ),
    body: ValueListenableBuilder(
      valueListenable: current,
      builder: ( context,  value,  child) {
        return  screen[current.value];
      },
    ),


    );
  }
}