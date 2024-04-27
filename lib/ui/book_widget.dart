import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:paloma_test/utils/app_colors.dart';
import 'package:paloma_test/utils/extensions.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({super.key, required this.link});

  final (String, String) link;

  @override
  Widget build(BuildContext context) {
    final imageProvider = CachedNetworkImageProvider(
      link.$2,
    );
    return FutureBuilder<PaletteGenerator>(
      future: Future.microtask(() async {
        var colors = await PaletteGenerator.fromImageProvider(imageProvider);
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
                  color: data.data?.mutedColor?.color ?? AppColors.black,
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
            blurColor: data.data?.mutedColor?.color ?? AppColors.black,
            overlay: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              width: 120 * 1.6,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(link.$1,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: data.data?.dominantColor?.color ?? Colors.white,
                    ).whiteOutlined.delaGothicOne),
              ),
            ),
          ),
        );
      },
    );
  }
}
