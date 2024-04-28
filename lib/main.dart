import 'package:bind3/bind3.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paloma_test/routers/app_router/app_router.dart';
import 'package:paloma_test/utils/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  late RouteCore routeCore = RouteCore.create(EmptyRepositoriesContainer(), _appRouter);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: kDebugMode,
      theme: theme.copyWith(
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
        ),
        scaffoldBackgroundColor: AppColors.white,
      ),
    );
  }
}
