
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paloma_test/routers/app_router/app_router.dart';
import 'package:paloma_test/utils/app_colors.dart';

@RoutePage()
class HomeWrapperPage extends StatelessWidget {
  static const double bottomPadding = 5;

  final List<IconData> pathIcons = [
    Icons.restaurant_menu_outlined,
    Icons.edit_note_rounded,
    // "assets/png/bottom_bar_house_icon.png",
    // "assets/png/bottom_bar_loupe_icon.png",
    // "assets/png/bottom_bar_chat_icon.png",
    // "assets/png/bottom_bar_user_icon.png",
  ];

  HomeWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        MenuWrapperRoute(),
        OrdersWrapperRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: ClipRect(
            //I'm using BackdropFilter for the blurring effect
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Opacity(
                //you can change the opacity to whatever suits you best
                opacity: 0.5,
                child: BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (index) {
                    tabsRouter.setActiveIndex(index);
                  },
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: AppColors.white,
                  // selectedItemColor: AppColors.errorText,
                  fixedColor: AppColors.white,
                  backgroundColor: AppColors.transparent,
                  items: List.generate(
                    pathIcons.length,
                        (index) => BottomNavigationBarItem(
                      backgroundColor: AppColors.transparent,
                      label: "",
                      icon: Padding(
                        padding: const EdgeInsets.all(bottomPadding),
                        child: Icon(
                          pathIcons[index],
                          size: 24,
                          color: AppColors.pal1ce9c46a,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.all(bottomPadding),
                        child: Icon(
                          pathIcons[index],
                          size: 24,
                          color: AppColors.pal1c2a9d8f,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
