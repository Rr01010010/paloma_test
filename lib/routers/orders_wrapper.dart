import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paloma_test/utils/app_colors.dart';

@RoutePage()
class OrdersWrapperPage extends StatefulWidget {
  const OrdersWrapperPage({super.key});

  @override
  State<OrdersWrapperPage> createState() => _OrdersWrapperPageState();
}

class _OrdersWrapperPageState extends State<OrdersWrapperPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: AutoRouter(),
    );
  }
}

