import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageNavigationCubit extends Cubit<int> {
  HomePageNavigationCubit() : super(0);

  void SelectedNavigationIndex(int indexSelect) {
    emit(indexSelect);
  }
}
