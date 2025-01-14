import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';
import 'package:portfolio/features/index/data/nab_bar_type.dart';
import 'package:portfolio/features/index/presentation/bloc/nav_bar_cubit/nav_bar_cubit.dart';

class NavBarItem extends StatefulWidget {
  final bool isSelected;
  final NavBarType type;

  const NavBarItem({super.key, required this.isSelected, required this.type});

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => context.read<NavBarCubit>().onSelectedNavBar(widget.type),
      child: MouseRegion(
        onHover: (_) => setState(() {
          isHovered = true;
        }),
        onExit: (_) => setState(() {
          isHovered = false;
        }),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color:widget.isSelected ? context.colorScheme.primary : context.colorScheme.primary.withOpacity(0), width: 2))),
              child: Text(widget.type.name,
                  style: context.textTheme.bodyLarge?.copyWith(
                      color: widget.isSelected || isHovered
                          ? context.colorScheme.primary
                          : context.colorScheme.onSurface,
                      fontWeight: widget.isSelected
                          ? FontWeight.w700
                          : FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
