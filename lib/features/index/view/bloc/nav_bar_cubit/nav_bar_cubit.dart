import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/index/data/models/nab_bar_type.dart';

class NavBarCubit extends Cubit<NavBarType>{
  NavBarCubit() : super(NavBarType.home);

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void onSelectedNavBar(NavBarType type){
    emit(type);
  }

  GlobalKey getNavBarKey(NavBarType type){
    switch(type){
      case NavBarType.home:
        return homeKey;
      case NavBarType.about:
        return aboutKey;
      case NavBarType.projects:
        return projectsKey;
      case NavBarType.contact:
        return contactKey;
    }
  }

}