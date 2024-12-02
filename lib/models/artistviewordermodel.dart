import 'package:cloud_firestore/cloud_firestore.dart';

class Artistviewordermodel{
  final String id;
  final String customername;
  final String place;
  final String post;
  final Timestamp deliverydate;
  final String status;
  final String payment;
  final int count;
  final String subtype;
  final String date;
  final double totalprice;
  final List referenceimage;

  Artistviewordermodel({required this.id, required this.date, required this.customername, required this.place, required this.post, required this.deliverydate, required this.status, required this.count, required this.subtype, required this.totalprice, required this.payment, required this.referenceimage});
}