import 'package:crafton/admin/Uidesign/functions/allartistgetfun.dart';
import 'package:crafton/admin/Uidesign/functions/complaintgetfun.dart';
import 'package:crafton/admin/Uidesign/functions/sendreply.dart';
import 'package:crafton/models/admingetcomplaintmodel.dart';
import 'package:crafton/models/artistmodel.dart';
import 'package:flutter/material.dart';

class Adminprovider extends ChangeNotifier{



  List<Artistmodel> artistwaitinglist=[];
  List<Artistmodel> artistapprovedlist=[];

  getartistfun(){
    artistgetfun();


  artistwaitinglist = artistlist
      .where((order) => order.status == 'pending')
      .toList();
  artistapprovedlist = artistlist
      .where((order) => order.status == 'Approved')
      .toList();
      print(artistwaitinglist.length);
      print(artistapprovedlist.length);

    notifyListeners();

  }


  List<Admingetcomplaintmodel> adminviewcomplaintlist=[];
  List<Admingetcomplaintmodel> complaintpendinglist=[];
  List<Admingetcomplaintmodel> repliedlist=[];

  admingetcomplaintfunction()async{
   adminviewcomplaintlist= await admingetcomplaintfun();
    print(adminviewcomplaintlist.length);
   


  complaintpendinglist = adminviewcomplaintlist
      .where((order) => order.reply == 'pending')
      .toList();
  repliedlist = adminviewcomplaintlist
      .where((order) => order.reply != 'pending')
      .toList();
      // print(complaintpendinglist.length);
      print("ff");
      print(repliedlist.length);

    notifyListeners();

  }
  sendreplyfunction(data, id,context){
    sendreplyfun(data, id,context);
    notifyListeners();
  }

  adminapproverejectartistfun(){
    
  }
}