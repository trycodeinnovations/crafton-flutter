import 'package:cloud_firestore/cloud_firestore.dart';

class Customergetordermodel{
  final String id;
  final String customerid;
  final String subtype;
  final String status;
  final String payment;
  final String artistname;
  final String artistphone;
  final String artistlandmark;
  final String date;
  final Timestamp deliverydate;
  final int count;
  final double totalprice;

  Customergetordermodel({required this.id, required this.customerid, required this.subtype, required this.status, required this.payment, required this.artistname, required this.artistphone, required this.artistlandmark, required this.date, required this.deliverydate, required this.count, required this.totalprice});
  

 
}