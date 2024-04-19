import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paloma_test/utils/app_colors.dart';

@RoutePage()
class MenuWrapperPage extends StatefulWidget {
  const MenuWrapperPage({super.key});

  @override
  State<MenuWrapperPage> createState() => _MenuWrapperPageState();
}

class _MenuWrapperPageState extends State<MenuWrapperPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: AutoRouter(),
    );
  }
}

