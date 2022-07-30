import 'package:demo/modules/main/blocs/main_bloc.dart';
import 'package:demo/modules/main/models/manga_model.dart';
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
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mangaItem.displayName(),
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            mangaItem.displayAuthor(),
            style: const TextStyle(
              fontSize: 15,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildMangaList() {
    return ListView.builder(
        itemBuilder: (context, index) {
          final mangaItem = _bloc.mangaList[index];
          return _buildMangaItem(mangaItem);
        },
        itemCount: _bloc.mangaList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
