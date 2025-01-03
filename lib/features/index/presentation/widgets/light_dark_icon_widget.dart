import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/app/core/presentation/bloc/theme_cubit/theme_cubit.dart';
import 'package:portfolio/app/core/presentation/bloc/theme_cubit/theme_state.dart';
import 'package:portfolio/app/utils/constant/app_constants.dart';
import 'package:portfolio/app/utils/extensions/context_extension.dart';

class ThemeIconWidget extends StatelessWidget {
  const ThemeIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemeState>(
        builder: (context,state)=> IconButton(
          onPressed: ()=> context.read<ThemeCubit>().onChangeTheme(),
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: SvgPicture.asset(
              color: context.colorScheme.onSurface,
              state.when(
                  light: ()=> '${AppConstants.iconPath}/dark.svg',
                  dark: ()=> '${AppConstants.iconPath}/light.svg',
              ),
              width: 24,
              height: 24,
            ),
          ),
        )
    );
  }
}
