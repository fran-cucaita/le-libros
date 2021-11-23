class Category {
  final String code;
  final String title;
  final String image;

  Category({required this.code, required this.title, required this.image});

  Category.fromJson(Map json)
      : code = json['code'],
        title = json['title'],
        image = json['image'];
}
