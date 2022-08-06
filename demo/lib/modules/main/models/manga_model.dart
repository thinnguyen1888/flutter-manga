class MangaModel {
  String id;
  String name;
  String? chapter;
  String author;
  double price;

  MangaModel({
    required this.id,
    required this.name,
    this.chapter,
    required this.author,
    required this.price,
  });

  String displayName() {
    return "Name: $name";
  }

  String displayAuthor() {
    return "Author: $author";
  }
}
