import 'package:auto_route/auto_route.dart';
import 'package:bind3/bind3.dart';
import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:paloma_test/ui/orders_main/orders_main_controller.dart';
import 'package:paloma_test/utils/app_colors.dart';
import 'package:paloma_test/utils/extensions.dart';

@RoutePage()
class OrdersMainPage extends StatefulWidget {
  const OrdersMainPage({super.key});

  @override
  State<OrdersMainPage> createState() => _OrdersMainPageState();
}

class _OrdersMainPageState
    extends BindStateController<OrdersMainPage, OrdersMainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      "our books",
                      style: const TextStyle(
                        fontSize: 24,
                        color: AppColors.black,
                        fontWeight: FontWeight.w900,
                      ).comfortaaMedium,
                    ),
                  ),
                  Observer(builder: (context) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 34),
                        child: Row(
                          children: routeController.menu.links.map((link) {
                            final imageProvider = CachedNetworkImageProvider(
                              link.$2,
                            );

                            return FutureBuilder<PaletteGenerator>(
                              future: Future.microtask(() async {
                                var colors =
                                    await PaletteGenerator.fromImageProvider(
                                        imageProvider);
                                return colors;
                              }),
                              initialData: null,
                              builder: (context, data) {
                                if (data.data == null) {
                                  return const SizedBox();
                                }

                                return Container(
                                  margin: const EdgeInsets.all(6),
                                  width: 120 * 1.6,
                                  height: 180 * 1.6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: data.data?.mutedColor?.color ??
                                              AppColors.black,
                                          // AppColors.black.withOpacity(0.7),
                                          blurRadius: 8,
                                          spreadRadius: 1,
                                          offset: const Offset(0, 1) * 4,
                                        )
                                      ]),
                                  alignment: Alignment.bottomCenter,
                                  child: const SizedBox(
                                    height: 28 * 1.6,
                                    width: double.maxFinite,
                                  ).blurred(
                                    alignment: Alignment.bottomCenter,
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    colorOpacity: 0.5,
                                    blurColor: data.data?.mutedColor?.color ??
                                        AppColors.black,
                                    overlay: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      width: 120 * 1.6,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerLeft,
                                        child: Text(link.$1,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              color: data.data?.dominantColor
                                                      ?.color ??
                                                  Colors.white,
                                            ).whiteOutlined.delaGothicOne),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }),
                  Text(
                    "name book",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w900,
                    ).comfortaaMedium,
                  ),
                  CupertinoTextField(
                    controller: routeController.editingController,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "image link",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w900,
                    ).comfortaaMedium,
                  ),
                  CupertinoTextField(
                    controller: routeController.photoLinkController,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: routeController.addBook,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.pal1c2a9d8f,
                        ),
                        child: Text(
                          "add book",
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.w900,
                          ).comfortaaMedium,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
