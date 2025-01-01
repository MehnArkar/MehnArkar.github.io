import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/utils/responsive/responsive_layout.dart';
import '../../../../app/core/presentation/bloc/theme_cubit/theme_cubit.dart';
import '../../../../app/utils/service_locator.dart';
import '../bloc/curdor_cubit/cursor_cubit.dart';
import '../widgets/cursor_widget.dart';

class IndexPage extends StatelessWidget {
  const IndexPage._({super.key});

  static Widget create(){
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context)=>injector.get<CursorCubit>())],
      child:const IndexPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CursorCubit,Offset>(
          builder: (context,state) {
          return MouseRegion(
            onHover: (event)=> context.read<CursorCubit>().onCursorChange(event.position),
            child: const Stack(
              children: [
                 CursorWidget(),
                 ResponsiveLayout(
                   mobile: Center(child: Text("mobile")),
                    tablet: Center(child: Text("tablet")),
                    desktop: Center(child: Text("desktop")),
                   watch: Center(child: Text("watch")),
                 )
              ],
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



