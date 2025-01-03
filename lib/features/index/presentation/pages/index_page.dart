import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/app/utils/responsive/responsive_layout.dart';
import 'package:portfolio/features/index/presentation/bloc/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:portfolio/features/index/presentation/widgets/custom_desktop_nav_bar.dart';
import '../../../../app/utils/service_locator.dart';
import '../bloc/curdor_cubit/cursor_cubit.dart';
import '../widgets/cursor_widget.dart';

class IndexPage extends StatelessWidget {
  const IndexPage._({super.key});

  static Widget create(){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>injector.get<CursorCubit>()),
        BlocProvider(create: (context)=>injector.get<NavBarCubit>())
      ],
      child:const IndexPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(context.textTheme.headlineSmall?.fontSize);
    print(context.textTheme.bodyLarge?.fontSize);
    print(context.textTheme.bodyMedium?.fontSize);

    return Scaffold(
      body: BlocBuilder<CursorCubit,Offset>(
          builder: (context,state) {
          return MouseRegion(
            onHover: (event)=> context.read<CursorCubit>().onCursorChange(event.position),
            child:  Stack(
              alignment: Alignment.topCenter,
              children: [
                /// NavBar
                CustomDesktopNavBar(),

                /// Body
                 ResponsiveLayout(
                   mobile: Center(child: Text("mobile",style: context.textTheme.bodyMedium,)),
                    tablet: Center(child: Text("tablet",style: context.textTheme.bodyMedium,)),
                    desktop: Center(child: Text("Desktop",style: context.textTheme.bodyMedium)),
                   watch: Center(child: Text("watch",style: context.textTheme.bodyMedium)),
                 ),

                /// Cursor
                CursorWidget(),
              ],
            ),
          );
        }
      ),
    );
  }
}



