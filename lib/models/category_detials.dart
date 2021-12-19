import 'package:elancer_api/models/event.dart';

class CategoryDetials {
  late int id;
  late String name;
  late String date;
  late String time;
  late String image;


  CategoryDetials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    time = json['time'];
    image = json['image_url'];
  }
}
