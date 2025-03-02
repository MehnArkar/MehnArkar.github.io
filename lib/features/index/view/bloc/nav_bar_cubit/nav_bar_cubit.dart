import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/index/data/models/nab_bar_type.dart';

class NavBarCubit extends Cubit<NavBarType>{
  NavBarCubit() : super(NavBarType.home);

  void onSelectedNavBar(NavBarType type){
    emit(type);
  }
}