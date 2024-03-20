import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/bloc/theme_bloc/theme_cubit.dart';
import 'package:portfolio/core/utils/responsive/responsive.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
          desktop: showMessage('Desktop',context),
          mobile: showMessage('Mobile',context),
          tablet: showMessage('Tablet',context)),
    );
  }
  
  Widget showMessage(String name,BuildContext context){
    return Center(
        child: ElevatedButton(
            onPressed: ()=> context.read<ThemeCubit>().onChangeTheme(),
            child: Text('Change Theme'))
    );
  }
}
