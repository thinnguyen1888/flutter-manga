class MangaModel {
  String id;
  String name;
  String? chapter;
  String author;
  double price;
  String? image;

  MangaModel({
    required this.id,
    required this.name,
    this.chapter,
    required this.author,
    required this.price,
    this.image
  });

  String displayName() {
    return "Name: $name";
  }

  String displayAuthor() {
    return "Author: $author";
  }
}
