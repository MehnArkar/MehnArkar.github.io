import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import '../bloc/curdor_cubit/cursor_cubit.dart';

class CursorWidget extends StatefulWidget {
  const CursorWidget({super.key});

  @override
  State<CursorWidget> createState() => _CursorWidgetState();
}

class _CursorWidgetState extends State<CursorWidget> with TickerProviderStateMixin{
  final double _largeCursorSize = 28;
  final double _smallCursorSize = 15;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Duration _zoomInOutDuration = const Duration(milliseconds: 150);
  late AnimationController _animationController;
  late AnimationController _clickAnimationController;


  @override
  void initState() {
    //Cursor animation
    _animationController = AnimationController(vsync: this,duration: _animationDuration)..addListener(() {
      if(_animationController.isCompleted){
        _animationController.reset();
      }
    });

    //Click animation
    _clickAnimationController = AnimationController(vsync: this,duration: _animationDuration)..addListener((){
      _clickAnimationController.reset();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CursorCubit,Offset>(
      listener: (context,state) async=>await _animationController.forward(),
      builder:(context,state)=> AnimatedPositioned(
          left: state.dx-(_smallCursorSize/2),
          top: state.dy-(_smallCursorSize/2),
          duration: _animationDuration,
          child:  IgnorePointer(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context,child) {
                return AnimatedContainer(
                  width:_animationController.isAnimating? _largeCursorSize : _smallCursorSize,
                  height: _animationController.isAnimating? _largeCursorSize : _smallCursorSize,
                  curve: Curves.easeIn,
                  alignment: Alignment.center,
                  duration: _zoomInOutDuration,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(color: context.colorScheme.primary,width: 1.5)
                  ),
                  child: _centerDot(),
                );
              }
            ),
          )
      ),
    );
  }

  Widget _centerDot(){
    return  Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
          color: context.colorScheme.primary,
          shape: BoxShape.circle
      ),
    );
  }
}