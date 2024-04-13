import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get comfortaa => copyWith(
        fontFamily: 'comfortaa',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get comfortaaBold => copyWith(
        fontFamily: 'comfortaa_bold',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get comfortaaLight => copyWith(
        fontFamily: 'comfortaa_light',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get comfortaaMedium => copyWith(
        fontFamily: 'comfortaa_medium',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get comfortaaRegular => copyWith(
        fontFamily: 'comfortaa_regular',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get comfortaaSemiBold => copyWith(
        fontFamily: 'comfortaa_semibold',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get delaGothicOne => copyWith(
        fontFamily: 'dela_gothic_one',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get jetbrainsMono => copyWith(
        fontFamily: 'jetbrains_mono',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );
}
