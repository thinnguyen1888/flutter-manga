import 'package:demo/modules/main/models/manga_model.dart';

class MainBloc {
  final mangaList = List<MangaModel>.empty(growable: true);

  void setUpData() {
    final manga01 =
        MangaModel(id: "1", name: "Conan", author: "HCM", price: 100);
    final manga02 =
        MangaModel(id: "2", name: "Dragon balls", author: "Akira", price: 20);
    final manga03 =
        MangaModel(id: "3", name: "007", author: "Stephen chow", price: 10000);

    mangaList.add(manga01);
    mangaList.add(manga02);
    mangaList.add(manga03);
    mangaList.add(manga01);
    mangaList.add(manga02);
    mangaList.add(manga03);
  }
}
