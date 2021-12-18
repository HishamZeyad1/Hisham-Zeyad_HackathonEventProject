import 'package:elancer_api/models/category_detials.dart';

class CategoryDetials {
  late int id;
  late String name;
  late String info;
  late String date;
  late String time;
  late String address;
  late int durationHours;
  late String image;
  late int categoryId;
  late int userId;
  late String createdAt;
  late int commentsCount;
  late int imagesCount;
  late String imageUrl;
  late String status;

  // List<CategoryDetials> images = [];
  // List<EventComment> comments = [];
  // late Category category;

  CategoryDetials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    date = json['date'];
    time = json['time'];
    address = json['address'];
    durationHours = json['duration_hours'];
    image = json['image'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    commentsCount = json['comments_count'];
    imagesCount = json['images_count'];
    imageUrl = json['image_url'];
    status = json['status'];
    //
    // if (json.containsKey('images') && json['images'] != null) {
    //   images = <EventImage>[];
    //   json['images'].forEach((v) {
    //     images.add(EventImage.fromJson(v));
    //   });
    // }
    // if (json.containsKey('comments') && json['comments'] != null) {
    //   comments = <EventComment>[];
    //   json['comments'].forEach((v) {
    //     comments.add(EventComment.fromJson(v));
    //   });
    // }
    // if (json.containsKey('category')) {
    //   Category.fromJson(json['category']);
    // }
  }
}
