import 'package:demo/modules/main/cubit/state/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  // Properties
  bool _toggleAppBarTitle = false;
  final _firstAppBarTitle = 'First Title';
  final _secondAppBarTitle = 'Second Title';
  // Constructor
  MainCubit() : super(const AppBarInitialState(title: 'First Title'));

  void updateAppBarTitle() {
    _toggleAppBarTitle = !_toggleAppBarTitle;
    emit(
      AppBarUpdateState(
        newTitle: _toggleAppBarTitle ? _secondAppBarTitle : _firstAppBarTitle,
      ),
    );
    emit(UpdateListState());
  }
}
