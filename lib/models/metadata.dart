class Metadata {
  final int page;
  final int perPage;
  final int pageCount;

  const Metadata(
      {required this.page, required this.perPage, required this.pageCount});

  Metadata.fromJson(Map json)
      : page = json['page'],
        perPage = json['per_page'],
        pageCount = json['page_count'];
}
