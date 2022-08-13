import 'package:demo/modules/main/blocs/main_bloc.dart';
import 'package:demo/modules/main/models/manga_model.dart';
import 'package:demo/modules/main/screens/photo_viewer_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  //state need create state
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _bloc = MainBloc();

  @override
  void initState() {
    super.initState();

    _bloc.setUpData();
  }

  Widget _buildMangaItem(MangaModel mangaItem) {
    const verticalSpacing8 = SizedBox(
      height: 8,
    );

    return Container(
      color: Colors.transparent, //fullfill
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mangaItem.displayName(),
            style: const TextStyle(fontSize: 20),
          ),
          verticalSpacing8,
          Text(
            mangaItem.displayAuthor(),
            style: const TextStyle(
              fontSize: 15,
              color: Colors.blue,
            ),
          ),
          verticalSpacing8,
          Image.asset(
            mangaItem.image ?? '',
            height: 120,
            fit: BoxFit.fill,
          ),
          verticalSpacing8,
          Container(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  void onTapHandler(MangaModel mangaModel) {
    Navigator.push(//create a new screen on top of Main screen
      context,
      MaterialPageRoute(
        builder: (context) => PhotoViewerScreen(
          imagePath: mangaModel.image ?? '',
          mangaTitle: mangaModel.name,
        ),
      ),
    );
  }

  Widget _buildMangaList() {
    return ListView.builder(
        itemBuilder: (context, index) {
          final model = _bloc.mangaList[index];
          return GestureDetector(
            //get event
            onTap: () {
              onTapHandler(model);
            },
            child: _buildMangaItem(model),
          );
        },
        itemCount: _bloc.mangaList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //wrap ui become 3 part
      appBar: AppBar(
        title: const Center(child: Text('Main')),
      ), //prevent rebuild
      body: Container(
        color: Colors.white,
        child: _buildMangaList(),
      ),
    );
  }
}
