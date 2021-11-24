class BookDetails {
  final String code;
  final String title;
  final String author;
  final String image;
  final String description;

  BookDetails({
    required this.code,
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });

  BookDetails.fromJson(Map json)
      : code = json['code'],
        title = json['title'],
        image = json['image'],
        author = json['author'],
        description = json['description'];
}
