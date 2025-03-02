import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectSliderBloc extends Cubit<int>{
  ProjectSliderBloc():super(0);

  onChangeIndex(int index){
    emit(index);
  }
}