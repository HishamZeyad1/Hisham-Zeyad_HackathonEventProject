class Category {
  // late int id;
  // late String title;
  // late String description;
  // late String image;
  // late int visible;
  // late int productsCount;

  late int id;
  late String nameEn;
  late String nameAr;
  late int active;
  late String image;
  late int eventsCount;


  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    active=json['active'];
    image = json['image'];
    eventsCount = json['events_count'];
  }
}
