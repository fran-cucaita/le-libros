class BookDetails {
  final String code;
  final String title;
  final String author;
  final String image;
  final String description;
  final String epubLink;
  final String mobiLink;

  BookDetails({
    required this.code,
    required this.title,
    required this.author,
    required this.image,
    required this.description,
    required this.epubLink,
    required this.mobiLink,
  });

  BookDetails.fromJson(Map json)
      : code = json['code'],
        title = json['title'],
        image = json['image'],
        author = json['author'],
        description = json['description'],
        epubLink = json['epub_link'],
        mobiLink = json['mobi_link'];
}
