class Book {
  final String code;
  final String title;
  final String image;

  Book({required this.code, required this.title, required this.image});

  Book.fromJson(Map<String, dynamic> bookMap)
      : this.code = bookMap['code'],
        this.title = bookMap['title'],
        this.image = bookMap['image'];
}
