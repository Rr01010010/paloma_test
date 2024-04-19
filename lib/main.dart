import 'package:cached_network_image/cached_network_image.dart';
import 'package:blur/blur.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:paloma_test/foundation/ice_flutter_toolkit.dart';
import 'package:paloma_test/routers/app_router/app_router.dart';
import 'package:paloma_test/utils/app_colors.dart';
import 'package:paloma_test/utils/extensions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    RouteCore.create(EmptyRepositoriesContainer(),routeCollection: _appRouter.routeCollection);

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
