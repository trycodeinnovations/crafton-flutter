import 'package:crafton/Artist/UIdesign/Uidesign/artistaddwork.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/artistsettings.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/worklist.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ValueNotifier<int> current = ValueNotifier(0);

class Artisthomescreen extends StatelessWidget {
  Artisthomescreen({super.key});
  List<Widget> screen = [const ArtistSettingsPage(), const Artistworklist(),ArtistAddwork()];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: current,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home",),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: "Work list"),
                    BottomNavigationBarItem(
                  icon: Icon(Icons.work_outline), label: "Add work "),
                  
            ],
              currentIndex: current.value,
            onTap: (value) async{
                if(value==1){
              var provider =Provider.of<Artistprovider>(context,listen: false);
              await provider.getworkfun();
              // await provider.customergetallartistlistfun();
              }
              current.value = value;

            },
             backgroundColor: Colors.grey[200], // Soft gray for the background
            selectedItemColor: Colors.teal, // Highlighted teal for selected items
            unselectedItemColor: Colors.black, 
          
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
