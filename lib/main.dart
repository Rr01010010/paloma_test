import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:paloma_test/utils/extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePageExample(),
    );
  }
}

class HomePageExample extends StatefulWidget {
  const HomePageExample({super.key});

  @override
  State<HomePageExample> createState() => _HomePageExampleState();
}

class _HomePageExampleState extends State<HomePageExample> {
  final links = [
    (
      "1984\nДжордж Оруэлл",
      "https://cdn.eksmo.ru/v2/ITD000000001222810/COVER/cover1__w820.jpg",
    ),
    (
      "Нейромант\nУильям Гибсон",
      "https://games.mail.ru/hotbox/content_files/gallery/c1/46/78e08098.jpeg",
    ),
    (
      "Дюна\nФрэнк Герберт",
      "https://img4.labirint.ru/rc/5c37c7af7b72722fb122d3494e57396e/363x561q80/books81/805594/cover.jpg?1653323143",
    ),
    (
      "Тень над Иннсмутом\nГовардт Лавкрафт",
      "https://2books.su/assets/img/covers/the-shadow-over-innsmouth-h-p-lovecraft.jpg",
    ),
    (
      "Солярис\nСтанислав Лем",
      "https://img3.labirint.ru/rc/111843981e1d94e5a5924104cf1a4ab7/363x561q80/books58/578929/cover.jpg?1687328748"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFDFF5DF),
      backgroundColor: const Color(0xFFFFD9D6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: SingleChildScrollView(
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
                                color: Colors.black,
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
                                children: links.map((link) {
                                  final imageProvider =
                                      CachedNetworkImageProvider(
                                    link.$2,
                                  );

                                  return FutureBuilder<PaletteGenerator>(
                                    future: Future.microtask(() async {
                                      var colors = await PaletteGenerator
                                          .fromImageProvider(imageProvider);
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: data.data?.mutedColor
                                                        ?.color ??
                                                    Colors.black,
                                                // Colors.black.withOpacity(0.7),
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
                                          blurColor:
                                              data.data?.mutedColor?.color ??
                                                  Colors.black,
                                          overlay: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            width: 120 * 1.6,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                link.$1,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.w700,
                                                    color: data
                                                            .data
                                                            ?.dominantColor
                                                            ?.color ??
                                                        Colors.white,
                                                    shadows: [
                                                      Shadow(
                                                        blurRadius: 4,
                                                          offset: Offset(-2.5, -2.5),
                                                          color: Colors.white,
                                                      ),
                                                      Shadow(
                                                        blurRadius: 4,
                                                          offset: Offset(-2.5, 2.5),
                                                          color: Colors.white,
                                                      ),
                                                      Shadow(
                                                        blurRadius: 4,
                                                          offset: Offset(2.5, -2.5),
                                                          color: Colors.white,
                                                      ),
                                                      Shadow(
                                                        blurRadius: 4,
                                                          offset: Offset(2.5, 2.5),
                                                          color: Colors.white,
                                                      ),
                                                    ]).delaGothicOne,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
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
          ),
        ),
      ),
    );
  }
}
