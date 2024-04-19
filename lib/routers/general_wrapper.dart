import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paloma_test/utils/app_colors.dart';

@RoutePage()
class GeneralWrapperPage extends StatefulWidget {
  const GeneralWrapperPage({super.key});

  @override
  State<GeneralWrapperPage> createState() => _GeneralWrapperPageState();
}

class _GeneralWrapperPageState extends State<GeneralWrapperPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: AutoRouter(),
    );
  }
}

