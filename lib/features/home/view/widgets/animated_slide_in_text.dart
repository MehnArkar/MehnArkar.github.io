import 'package:flutter/material.dart';

class AnimatedSlideInText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final bool isNext;
  const AnimatedSlideInText({super.key,required this.text,this.style,required this.isNext});

  @override
  State<AnimatedSlideInText> createState() => _AnimatedSlideInTextState();
}

class _AnimatedSlideInTextState extends State<AnimatedSlideInText> {
  late String _currentText;
  late bool _isNext;

  @override
  void initState() {
    super.initState();
    _currentText = widget.text;
    _isNext = widget.isNext;
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text || widget.isNext != oldWidget.isNext) {
      setState(() {
        _currentText = widget.text;
        _isNext = widget.isNext;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      transitionBuilder: (Widget child, Animation<double> animation) {

        final slideAnimation = Tween<Offset>(
          // begin: _isNext ? const Offset(1, 0) : const Offset(-1, 0),
          begin: _isNext
              ? (child.key == ValueKey(_currentText) ? const Offset(1, 0) : const Offset(-1, 0))
              : (child.key == ValueKey(_currentText) ? const Offset(-1, 0) : const Offset(1, 0)),
          end: Offset.zero,
        ).animate(animation);

        final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);

        return ClipRect(
          child: SlideTransition(
            position: slideAnimation,
            child: FadeTransition(
                opacity: fadeAnimation,
                child: child),
          ),
        );
      },
      child: Text(
        _currentText,
        key: ValueKey(_currentText), // Ensures a new widget is created when text changes
        style: widget.style,
      ),
    );
  }
}
