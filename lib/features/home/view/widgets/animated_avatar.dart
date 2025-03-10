import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedAvatar extends StatefulWidget {
  final double? width;
  const AnimatedAvatar({super.key,this.width});

  @override
  State<AnimatedAvatar> createState() => _AnimatedAvatarState();
}

class _AnimatedAvatarState extends State<AnimatedAvatar> {

  late StateMachineController controller;
  SMITrigger? _idle;
  SMITrigger? _hover;
  SMITrigger? _happy;
  SMITrigger? _sad;
  SMITrigger? _thinking;


  void _onRiveInit(Artboard artboard) {
    //add controller on artboard
    controller = StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(controller);

    //set animation trigger
    _idle = controller.findInput<bool>('idle') as SMITrigger;
    _hover = controller.findInput<bool>('hover') as SMITrigger;
    _happy = controller.findInput<bool>('happy') as SMITrigger;
    _sad = controller.findInput<bool>('sad') as SMITrigger;
    _thinking = controller.findInput<bool>('thinking') as SMITrigger;

   //animate _hover at first time
   WidgetsBinding.instance.addPostFrameCallback((duration) {
      Future.delayed(const Duration(milliseconds: 500)).then((_){
        _hover?.fire();
      });
   });

  }



  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_)=>_happy?.fire(),
      child: GestureDetector(
        onTap:()=>_thinking?.fire(),
        child: SizedBox(
          width: widget.width,
          child: AspectRatio(
            aspectRatio: 700/800,
            child: RiveAnimation.asset(
              'assets/animations/avatar.riv',
              fit: BoxFit.cover,
              onInit: _onRiveInit,
            ),
          ),
        ),
      ),
    );
  }
}
