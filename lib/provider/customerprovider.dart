import 'package:crafton/models/customergetallartist.dart';
import 'package:crafton/models/customergetoffermodel.dart';
import 'package:crafton/models/customergetworklistmodel.dart';
import 'package:crafton/models/customerviewartistgallerymodel.dart';
import 'package:crafton/models/customerviewcomplaintmodel.dart';
import 'package:crafton/models/ustomergetordersmodel.dart';
import 'package:crafton/user/Uidesign/functions.dart/customergetallartist.dart';
import 'package:crafton/user/Uidesign/functions.dart/customergetallworksbyartistid.dart';
import 'package:crafton/user/Uidesign/functions.dart/customergetartistsgalleryfun.dart';
import 'package:crafton/user/Uidesign/functions.dart/customergetartistworkfun.dart';
import 'package:crafton/user/Uidesign/functions.dart/customergetcomplaintfun.dart';
import 'package:crafton/user/Uidesign/functions.dart/customergetofferfun.dart';
import 'package:crafton/user/Uidesign/functions.dart/customerprofilreditfun.dart';
import 'package:crafton/user/Uidesign/functions.dart/ordergetfun.dart';
import 'package:crafton/user/Uidesign/functions.dart/payfun.dart';
import 'package:crafton/user/Uidesign/functions.dart/sendcomplaintfun.dart';
import 'package:flutter/material.dart';
List<Customergetworkmodel> customergetworklist=[];
 List<Customergetworkmodel> customergetframelist=[];
List<Customergetworkmodel> customergetalbumlist=[];
List<Customergetworkmodel> customergetotherlist=[];
List<Customergetallartistmodel> customerviewartistlist=[];
List<Customergetallartistmodel> customerviewartistlist1=[];
List <Customerviewcomplaintmodel>customerviewcomplaintlist=[];



class Customerprovider extends ChangeNotifier{
   List<Customergetworkmodel> filteredWorkList = [];
    List<Customergetworkmodel> filteredframeList = [];
    List<Customergetworkmodel> filteredalbumList = [];
    List<Customergetworkmodel> filteredotherList = [];
  List<Customergetworkmodel>customerworkbyartistlist=[];
  List<customergetgallerymodel>customerviewgallerylist=[];
   List<Customergetoffermodel> customergetofferlist=[];
  int count=0;
  double grandtotal=0;
  List<Customergetordermodel>customergetorderlist=[];


customergetworkfun()async{
 customergetworklist =await customergetworklistfunction();
 customergetalbumlist.clear();
 customergetframelist.clear();
 customergetotherlist.clear();
 bool iscntain=false;
    Set<String> frameSubtypes = {};
    Set<String> albumSubtypes = {};
    Set<String> otherSubtypes = {};

    for (var work in customergetworklist) {
      if (work.name == 'Frames' && !frameSubtypes.contains(work.subtype)) {
        customergetframelist.add(work); 
        frameSubtypes.add(work.subtype); 
      } else if (work.name == 'Albums' && !albumSubtypes.contains(work.subtype)) {
        customergetalbumlist.add(work); 
        albumSubtypes.add(work.subtype);
      } else if (work.name == 'Others' && !otherSubtypes.contains(work.subtype)) {
        customergetotherlist.add(work); 
        otherSubtypes.add(work.subtype);
      }
    }

    print(customergetalbumlist.length);



  notifyListeners();
}

customergetallartistlistfun()async{
  customerviewartistlist1=await customergetartistfun();
  print(customerviewartistlist1);

  
  customerviewartistlist = customerviewartistlist1
      .where((artist) => artist.status == 'Approved')
      .toList();
  notifyListeners();
  print(customerviewartistlist.length);

}


customergetgalleryfunction()async{

  customerviewgallerylist=await customergetartistgalleryfun();
  print(customerviewgallerylist.length);
  notifyListeners();
}


customergetofferfunction()async{
  customergetofferlist=await customergetofferfun();
  print(customergetofferlist.length);
  notifyListeners();

}


customergetworkbyartistfun()async{
  customerworkbyartistlist=await customergetworklistbyartistfunction();
  print(customerworkbyartistlist.length);
  notifyListeners();

}
countincrement(){
  count==0;
  count++;
  notifyListeners();
}
countdecrement(){
  count==0;
  if(count>1){
    count--;
    notifyListeners();
  }
}
// grandtotalamount(){
//   grandtotal=count*


// }

customergetorderfun()async{
  customergetorderlist=await customergetorderfunction();
  notifyListeners();
  print(customergetorderlist.length);

}
customerprofileeditfunction(data,id){
  customerprofileeditfun(data, id);
  notifyListeners();
}
paymentfunction(data,id){
  paymentfun(data, id);
  notifyListeners();
}
customeraddcomplaintfun(data){
  addcomplaintfun(data);
  notifyListeners();
}
  
  customergetcomplainfunction()async{
    customerviewcomplaintlist=await customergetcomplaintfun();
    notifyListeners();

  }

Customerprovider() {
    filteredWorkList = customergetworklist; 
    // Initialize with all works
    filteredframeList=customergetframelist;
    filteredalbumList=customergetalbumlist;
    filteredotherList=customergetotherlist;
  }

   filterWorks(String query) {
    if (query.isEmpty) {
      print(customergetworklist.length);
      filteredWorkList = customergetworklist;
    } else {
      filteredWorkList = customergetworklist
          .where((work) => work.subtype.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
     if (query.isEmpty) {
      print(customergetframelist.length);
      filteredframeList = customergetframelist;
    } else {
      filteredframeList = customergetframelist
          .where((work) => work.subtype.toLowerCase().contains(query.toLowerCase()))
          .toList();
    
  }
    if (query.isEmpty) {
      print(customergetalbumlist.length);
      filteredalbumList = customergetalbumlist;
    } else {
      filteredalbumList = customergetalbumlist
          .where((work) => work.subtype.toLowerCase().contains(query.toLowerCase()))
          .toList();
    
  }
    if (query.isEmpty) {
      print(customergetotherlist.length);
      filteredotherList = customergetotherlist;
    } else {
      filteredotherList = customergetotherlist
          .where((work) => work.subtype.toLowerCase().contains(query.toLowerCase()))
          .toList();
    
  }
  notifyListeners();
 

}}


















//  

// else if (work.name == 'albums') {
//         // Only add to album list if the subtype is unique
//         if (!uniqueSubtypes.contains(work.subtype)) {
//           customergetalbumlist.add(work);  // Add work if subtype is unique
//           uniqueSubtypes.add(work.subtype); // Track the subtype to avoid duplicates
//         }}
//        else if(work.name=='Others'){
//         customergetotherlist.add(work); // All other categories go here
//       }