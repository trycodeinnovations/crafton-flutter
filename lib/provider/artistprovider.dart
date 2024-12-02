import 'package:crafton/Artist/UIdesign/fuctions/addofferfun.dart';
import 'package:crafton/Artist/UIdesign/fuctions/addworkfun.dart';
import 'package:crafton/Artist/UIdesign/fuctions/artistgetofferfun.dart';
import 'package:crafton/Artist/UIdesign/fuctions/deletefun.dart';
import 'package:crafton/Artist/UIdesign/fuctions/deleteofferfun.dart';
import 'package:crafton/Artist/UIdesign/fuctions/editworkfun.dart';
import 'package:crafton/Artist/UIdesign/fuctions/getgalleryfun.dart';
import 'package:crafton/Artist/UIdesign/fuctions/getorderfun.dart';
import 'package:crafton/Artist/UIdesign/fuctions/getworklistfun.dart';
import 'package:crafton/Artist/UIdesign/fuctions/profileeditfun.dart';
import 'package:crafton/models/Artistworklistmodel.dart';
import 'package:crafton/models/artistgetoffermodel.dart';
import 'package:crafton/models/artistviewordermodel.dart';
import 'package:crafton/models/gallerymodel.dart';
import 'package:flutter/material.dart';



class Artistprovider extends ChangeNotifier{

 List<Artistworklistmodel> artistworklist=[];
 List<Gallerymodel> gallerylist=[];
//  List<Gallerymodel> gallerylist=[];
List<Artistviewordermodel>artistvieworderlist=[];
List<Artistgetoffermodel>artistofferlist=[];
List<Artistviewordermodel>artistvieworwaitingderlist=[];
List<Artistviewordermodel>artistviewacceptedorderlist=[];
List<Artistviewordermodel>artistviewdeliveredorderlist=[];


  addworkfun(data,context){

    Artistaddworkfun(data,context);
    notifyListeners();
  }

 

getworkfun()async{
  artistworklist=await getworklistfunction();
  notifyListeners();
}

artistgetgalleryfun()async{
  gallerylist=await getgallryfun();
  notifyListeners();
}

artistgetofferfunction()async{
  artistofferlist=await artistgetofferfunc();
  notifyListeners();
}


getorderviewfun() async {
  artistvieworderlist = await artistgetorderfunction();

  artistvieworwaitingderlist = artistvieworderlist
      .where((order) => order.status == 'pending')
      .toList();
  artistviewacceptedorderlist = artistvieworderlist
      .where((order) => order.status == 'accepted')
      .toList();
  artistviewdeliveredorderlist = artistvieworderlist
      .where((order) => order.status == 'delivered')
      .toList();

  notifyListeners(); 
  print(artistvieworderlist.length);
  print(artistvieworwaitingderlist.length);
  print(artistviewacceptedorderlist.length);


}



getworklistfun(){
  getworklistfunction();
  notifyListeners();
}

  deletefun(id){
    deleteworkfun(id);
    getworkfun();
    notifyListeners();
  }


deleteofferfunction(id){
  deleteofferfun(id);
  notifyListeners();
}



  String? selectedCategory;
  String? selectedSubcategory;

  List<String> category = ['Frames', 'Albums', 'Others'];
  List<String> subframe = ['Miniframe', 'A4frame'];
  List<String> subalbums = ['Normalalbum', 'Ringalbums'];
  List<String> othersub = ['Embroidery','Pencil drawing','Painting'];

  List<String> subcategory = [];

  // Method to update category and subcategories
updateCategory(String? value) {
    selectedCategory = value;
    selectedSubcategory = null; // Reset subcategory when category changes

    if (value == 'Frames') {
      subcategory = subframe;
    } else if (value == 'Albums') {
      subcategory = subalbums;
    } else if (value == 'Others') {
      subcategory = othersub;
    }

    notifyListeners(); // Notify listeners about the change
  }

  // Method to update selected subcategory
  updateSubcategory(String? value) {
    selectedSubcategory = value;
    notifyListeners();
  }

  // orderacceptfunction(data,id){
  //   orderacceptfun(data,id);
  //   notifyListeners();
  // }
artisteditprofilefunction(data,id){
  artistprofileeditfun(data, id);
  notifyListeners();
}
editworkfunction(data, id){
  editworkfun(data, id);
  notifyListeners();
}
artistaddofferfunction(data, context){
  artistaddofferfun(data, context);
  print("1success");
  notifyListeners();
}
  

}




