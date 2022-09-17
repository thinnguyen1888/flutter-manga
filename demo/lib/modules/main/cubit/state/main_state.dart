abstract class MainState {
  const MainState();
}

//child state
class AppBarInitialState extends MainState {
  final String title;

  const AppBarInitialState({
    required this.title,
  });
}

//child state
class AppBarUpdateState extends MainState {
  final String newTitle;

  const AppBarUpdateState({
    required this.newTitle,
  });
}

class UpdateListState extends MainState {}
