import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class CursorCubit extends Cubit<Offset>{
  CursorCubit():super(Offset.zero);

  onCursorChange(Offset position){
    emit(position);
  }
}