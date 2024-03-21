import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/bloc/theme_bloc/theme_cubit.dart';
import 'package:portfolio/core/utils/responsive/responsive.dart';
import 'package:portfolio/core/utils/service_locator.dart';
import 'package:portfolio/features/index/bloc/cursor_cubit.dart';

import '../widgets/cursor_widget.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>injector.get<CursorCubit>())
      ],
      child: BlocBuilder<CursorCubit,Offset>(
        builder: (context,state) {
          return Scaffold(
            body: MouseRegion(
              onHover: (event){
                  context.read<CursorCubit>().onCursorChange(event.position);
              },

              child: const Stack(
                children: [
                   CursorWidget()
                ],
              ),
            ),
          );
        }
      ),
    );
  }
  
  Widget showMessage(String name,BuildContext context){
    return Center(
        child: ElevatedButton(
            onPressed: ()=> context.read<ThemeCubit>().onChangeTheme(),
            child: const Text('Change Theme'))
    );
  }
}



