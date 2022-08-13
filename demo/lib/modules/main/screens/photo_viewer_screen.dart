import 'package:flutter/material.dart';

class PhotoViewerScreen extends StatelessWidget {
  // Properties
  final String imagePath;
  final String? mangaTitle;

  const PhotoViewerScreen({
    Key? key,
    required this.imagePath,
    this.mangaTitle = 'Manga Detail',
  }) : super(key: key);

  Widget _buildPhotoViewer(BuildContext context) {
    //add context to know this screen
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); //remove current screen by using pop method
      },
      child: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            imagePath,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mangaTitle ?? '',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: _buildPhotoViewer(context),
    );
  }
}
