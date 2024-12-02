import 'package:crafton/Artist/UIdesign/Uidesign/Artisthome.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/addgallery.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/artistaddwork.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/artistprofile.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/editartistwork.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/registration.dart';
import 'package:crafton/Artist/UIdesign/Uidesign/worklist.dart';
import 'package:crafton/provider/adminprovider.dart';
import 'package:crafton/provider/artistprovider.dart';
import 'package:crafton/provider/customerprovider.dart';
import 'package:crafton/UIdesigns/loginpage.dart';
import 'package:crafton/admin/Uidesign/Uidesign/homescreen.dart';
import 'package:crafton/admin/Uidesign/Uidesign/settings.dart';
import 'package:crafton/user/Uidesign/registration.dart';
import 'package:crafton/user/Uidesign/userhome.dart';
import 'package:crafton/user/Uidesign/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


void main() async{

WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(providers:[ChangeNotifierProvider<Adminprovider>(create: (context) {
      return Adminprovider();
    },),ChangeNotifierProvider<Artistprovider>(create: (context) {
      return Artistprovider();
    },),
    ChangeNotifierProvider<Customerprovider>(create: (context) {
      return Customerprovider();
    },)] ,
    child: 
    MaterialApp(
     routes: {
      "firstscreen":(context)=>const LoginScreen(),
      "artistregistration":(context)=>ArtistRegistration(),
      "userregistration":(context)=>const UserRegistration(),
      "adminhome":(context)=>Adminhomescreen(),
      "adminsettings":(context)=>const AdminSettingspage(),
      "artisthome":(context)=>Artisthomescreen(),
      "userhome":(context)=>Userhomescreen(),
      // "viewartistlist":(context)=>AdminviewArtistlist(),
      // "viewartistdetails":(context)=>AdminViewartistdetails(),
      // "viewuserdetails":(context)=>AdminViewuserdetails(),
      "artistprofile":(context)=>const Artistprofile(),
      "customerprofile":(context)=>const UserProfile(),
      "worklist":(context)=>const Artistworklist(),
      // "viewworkdetails":(context)=>Viewworkdetails(),
      "artisteditwork":(context)=>const Artisteditwork(),
      "addwork":(context)=>ArtistAddwork(),
      // "viewaristpage":(context)=>Artistpage(),
      "addgallery":(context)=>GalleryPage()
     
      
     

     



      

      
      
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "firstscreen",
      // home: 
      // AdminSettingspage()
      // LoginScreen()
      // ArtistRegistration()
    ));
  }
}
