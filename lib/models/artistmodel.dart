class Artistmodel {
  final String id;
  final String name;
  final String place;
  final String district;
  final String post;
  final String landmark;
  final String phonenumber;
  
  final String status;
  final String socialmedia;
  


  Artistmodel( 
      {required this.id,
      required this.phonenumber,
      required this.status,
      required this.name,
      required this.place,
      required this.district,
      required this.post,required this.socialmedia,
       required this.landmark});
}
