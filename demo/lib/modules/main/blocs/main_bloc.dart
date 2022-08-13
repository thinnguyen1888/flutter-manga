import 'package:demo/modules/main/models/manga_model.dart';
import 'package:demo/shared/image_manager.dart';

class MainBloc {
  final mangaList = List<MangaModel>.empty(growable: true);

  void setUpData() {
    final manga01 = MangaModel(
        id: "1",
        name: "Conan",
        author: "HCM",
        price: 100,
        image: ImageManager.imgConan);
    final manga02 = MangaModel(
        id: "2",
        name: "Dragon balls",
        author: "Akira",
        price: 20,
        image: ImageManager.imgDragonBall);
    final manga03 = MangaModel(
        id: "3",
        name: "007",
        author: "Stephen chow",
        price: 10000,
        image: ImageManager.img007);

    mangaList.add(manga01);
    mangaList.add(manga02);
    mangaList.add(manga03);
  }
}
