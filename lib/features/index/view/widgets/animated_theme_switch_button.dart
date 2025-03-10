import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/core/presentation/bloc/theme_cubit/theme_cubit.dart';
import 'package:portfolio/app/core/presentation/bloc/theme_cubit/theme_state.dart';
import 'package:rive/rive.dart';

class AnimatedThemeSwitchButton extends StatefulWidget {
  final double? width;
  const AnimatedThemeSwitchButton({super.key,this.width});

  @override
  State<AnimatedThemeSwitchButton> createState() => _AnimatedThemeSwitchButtonState();
}

class _AnimatedThemeSwitchButtonState extends State<AnimatedThemeSwitchButton> {

  late StateMachineController controller;
  SMIBool? _isDark;


  void _onRiveInit(Artboard artboard) {
    //add controller on artboard
    controller = StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(controller);
    //get trigger
    _isDark = controller.findSMI('isDark') as SMIBool;
    //change light theme to init state
    _isDark?.change(false);

  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemeState>(
      builder: (context,state) {
        return InkWell(
          onTap:(){
            _isDark?.change(state is DarkTheme ? false : true);
            Future.delayed((const Duration(milliseconds: 500))).then((_){
              if(context.mounted) context.read<ThemeCubit>().onChangeTheme();
            });

          },
          child: SizedBox(
            width: widget.width,
            child: AspectRatio(
              aspectRatio: 510/260,
              child: RiveAnimation.asset(
                'assets/animations/theme.riv',
                fit: BoxFit.cover,
                onInit: _onRiveInit,
              ),
            ),
          ),
        );
      }
    );
  }
}
