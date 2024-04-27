import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:paloma_test/foundation/route_core/controller_state.dart';
import 'package:paloma_test/ui/book_widget.dart';
import 'package:paloma_test/ui/menu_main/menu_main_controller.dart';
import 'package:paloma_test/utils/app_colors.dart';
import 'package:paloma_test/utils/extensions.dart';

@RoutePage()
class MenuMainPage extends StatefulWidget {
  const MenuMainPage({super.key});

  @override
  State<MenuMainPage> createState() => _MenuMainPageState();
}

class _MenuMainPageState
    extends BindStateController<MenuMainPage, MenuMainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Observer(builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...["book", "audio", "film", "podcast"]
                      .map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 14),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text(
                                e,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w900,
                                ).comfortaaMedium,
                              ),
                            ),
                            // const SizedBox(height: 24),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, bottom: 34),
                                child: Row(
                                  children: List.generate(
                                      routeController.links.length, (index) {
                                    final link = routeController.links[index];
                                    return GestureDetector(
                                        onTap: () =>
                                            routeController.removeAt(index),
                                        child: BookWidget(link: link));
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
