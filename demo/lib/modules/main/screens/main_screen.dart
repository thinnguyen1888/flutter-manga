import 'package:demo/modules/main/blocs/main_bloc.dart';
import 'package:demo/modules/main/cubit/main_cubit.dart';
import 'package:demo/modules/main/cubit/state/main_state.dart';
import 'package:demo/modules/main/models/manga_model.dart';
import 'package:demo/modules/main/screens/photo_viewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  final String bottomTitle;

  //state need create state
  const MainScreen._({
    Key? key,
    required this.bottomTitle,
  }) : super(key: key);

  // State: 01
  @override
  _MainScreenState createState() => _MainScreenState();

  static Widget newInstance({
    Key? key,
    required String bottomTitle,
  }) {
    // wrap MainScreen with MainCubit by using BlocProvider
    return BlocProvider<MainCubit>(
      create: (_) => MainCubit(),
      child: MainScreen._(
        key: key,
        bottomTitle: bottomTitle,
      ),
    );
  }
}

class _MainScreenState extends State<MainScreen> {
  final _bloc = MainBloc();
  // Use late keyword cause _cubit variable can not be null
  // and will be assigned data later in initState function
  late MainCubit _cubit;

  // State: 01 - Run only one time
  @override
  void initState() {
    super.initState();

    // Used for call api, initial data one time...
    _bloc.setUpData();

    // Get MainCubit from BlocProvider within current context
    // then assign it to _cubit variable
    _cubit = BlocProvider.of<MainCubit>(context);
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
    Navigator.push(
      //create a new screen on top of Main screen
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
        title: GestureDetector(
          onTap: () => _cubit.updateAppBarTitle(),
          child: Container(
            child: Center(
              child: BlocBuilder<MainCubit, MainState>(
                  //BlockBuilder return UI base on state
                  buildWhen: (previousState, currentState) =>
                      currentState is AppBarInitialState ||
                      currentState is AppBarUpdateState,
                  builder: (context, state) {
                    if (state is AppBarInitialState) {
                      return Text(state.title);
                    } else if (state is AppBarUpdateState) {
                      return Text(state.newTitle);
                    }

                    return const SizedBox();
                  }),
            ),
          ),
        ),
      ), //prevent rebuild
      body: Container(
        color: Colors.white,
        child: _buildMangaList(),
      ),
    );
  }
}
