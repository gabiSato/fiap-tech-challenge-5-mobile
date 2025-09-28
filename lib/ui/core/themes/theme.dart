import "package:flutter/material.dart";

// Gerado pelo Material Build Plugin
class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006d3d),
      surfaceTint: Color(0xff006d3d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff26d07c),
      onPrimaryContainer: Color(0xff00532d),
      secondary: Color(0xff326946),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffb2edc1),
      onSecondaryContainer: Color(0xff376d4a),
      tertiary: Color(0xff1561a0),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7ebaff),
      onTertiaryContainer: Color(0xff00497f),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff3fcf1),
      onSurface: Color(0xff161d17),
      onSurfaceVariant: Color(0xff3c4a3f),
      outline: Color(0xff6c7b6e),
      outlineVariant: Color(0xffbbcbbc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2a322c),
      inversePrimary: Color(0xff40e18b),
      primaryFixed: Color(0xff63fea5),
      onPrimaryFixed: Color(0xff00210f),
      primaryFixedDim: Color(0xff40e18b),
      onPrimaryFixedVariant: Color(0xff00522c),
      secondaryFixed: Color(0xffb5f0c4),
      onSecondaryFixed: Color(0xff00210f),
      secondaryFixedDim: Color(0xff99d4a9),
      onSecondaryFixedVariant: Color(0xff185130),
      tertiaryFixed: Color(0xffd2e4ff),
      onTertiaryFixed: Color(0xff001d36),
      tertiaryFixedDim: Color(0xff9fcaff),
      onTertiaryFixedVariant: Color(0xff00497e),
      surfaceDim: Color(0xffd4dcd2),
      surfaceBright: Color(0xfff3fcf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf6ec),
      surfaceContainer: Color(0xffe8f0e6),
      surfaceContainerHigh: Color(0xffe2ebe0),
      surfaceContainerHighest: Color(0xffdce5db),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003f21),
      surfaceTint: Color(0xff006d3d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff007e47),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003f21),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff417854),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003862),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2c70b0),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff3fcf1),
      onSurface: Color(0xff0b130d),
      onSurfaceVariant: Color(0xff2c392f),
      outline: Color(0xff48564a),
      outlineVariant: Color(0xff627164),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2a322c),
      inversePrimary: Color(0xff40e18b),
      primaryFixed: Color(0xff007e47),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006236),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff417854),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff285f3d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff2c70b0),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005795),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc0c9bf),
      surfaceBright: Color(0xfff3fcf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf6ec),
      surfaceContainer: Color(0xffe2ebe0),
      surfaceContainerHigh: Color(0xffd7dfd5),
      surfaceContainerHighest: Color(0xffcbd4ca),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00341a),
      surfaceTint: Color(0xff006d3d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00552e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00341a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff1b5332),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002e52),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004b82),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff3fcf1),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff222f25),
      outlineVariant: Color(0xff3f4d41),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2a322c),
      inversePrimary: Color(0xff40e18b),
      primaryFixed: Color(0xff00552e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003b1e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff1b5332),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003b1e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004b82),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00345c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb2bbb2),
      surfaceBright: Color(0xfff3fcf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeaf3e9),
      surfaceContainer: Color(0xffdce5db),
      surfaceContainerHigh: Color(0xffced7cd),
      surfaceContainerHighest: Color(0xffc0c9bf),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff50ed95),
      surfaceTint: Color(0xff40e18b),
      onPrimary: Color(0xff00391d),
      primaryContainer: Color(0xff26d07c),
      onPrimaryContainer: Color(0xff00532d),
      secondary: Color(0xff99d4a9),
      onSecondary: Color(0xff00391d),
      secondaryContainer: Color(0xff185130),
      onSecondaryContainer: Color(0xff88c299),
      tertiary: Color(0xffb4d4ff),
      onTertiary: Color(0xff003259),
      tertiaryContainer: Color(0xff7ebaff),
      onTertiaryContainer: Color(0xff00497f),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e150f),
      onSurface: Color(0xffdce5db),
      onSurfaceVariant: Color(0xffbbcbbc),
      outline: Color(0xff869587),
      outlineVariant: Color(0xff3c4a3f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdce5db),
      inversePrimary: Color(0xff006d3d),
      primaryFixed: Color(0xff63fea5),
      onPrimaryFixed: Color(0xff00210f),
      primaryFixedDim: Color(0xff40e18b),
      onPrimaryFixedVariant: Color(0xff00522c),
      secondaryFixed: Color(0xffb5f0c4),
      onSecondaryFixed: Color(0xff00210f),
      secondaryFixedDim: Color(0xff99d4a9),
      onSecondaryFixedVariant: Color(0xff185130),
      tertiaryFixed: Color(0xffd2e4ff),
      onTertiaryFixed: Color(0xff001d36),
      tertiaryFixedDim: Color(0xff9fcaff),
      onTertiaryFixedVariant: Color(0xff00497e),
      surfaceDim: Color(0xff0e150f),
      surfaceBright: Color(0xff333b34),
      surfaceContainerLowest: Color(0xff08100a),
      surfaceContainerLow: Color(0xff161d17),
      surfaceContainer: Color(0xff1a211b),
      surfaceContainerHigh: Color(0xff242c25),
      surfaceContainerHighest: Color(0xff2f3730),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff5cf89f),
      surfaceTint: Color(0xff40e18b),
      onPrimary: Color(0xff002d15),
      primaryContainer: Color(0xff26d07c),
      onPrimaryContainer: Color(0xff003219),
      secondary: Color(0xffafeabe),
      onSecondary: Color(0xff002d15),
      secondaryContainer: Color(0xff659d76),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc7deff),
      onTertiary: Color(0xff002747),
      tertiaryContainer: Color(0xff7ebaff),
      onTertiaryContainer: Color(0xff002c4e),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e150f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd1e0d1),
      outline: Color(0xffa6b6a8),
      outlineVariant: Color(0xff859487),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdce5db),
      inversePrimary: Color(0xff00532d),
      primaryFixed: Color(0xff63fea5),
      onPrimaryFixed: Color(0xff001508),
      primaryFixedDim: Color(0xff40e18b),
      onPrimaryFixedVariant: Color(0xff003f21),
      secondaryFixed: Color(0xffb5f0c4),
      onSecondaryFixed: Color(0xff001508),
      secondaryFixedDim: Color(0xff99d4a9),
      onSecondaryFixedVariant: Color(0xff003f21),
      tertiaryFixed: Color(0xffd2e4ff),
      onTertiaryFixed: Color(0xff001225),
      tertiaryFixedDim: Color(0xff9fcaff),
      onTertiaryFixedVariant: Color(0xff003862),
      surfaceDim: Color(0xff0e150f),
      surfaceBright: Color(0xff3e473f),
      surfaceContainerLowest: Color(0xff030905),
      surfaceContainerLow: Color(0xff181f19),
      surfaceContainer: Color(0xff222a23),
      surfaceContainerHigh: Color(0xff2c352e),
      surfaceContainerHighest: Color(0xff374039),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbeffcf),
      surfaceTint: Color(0xff40e18b),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff3bdd87),
      onPrimaryContainer: Color(0xff000f05),
      secondary: Color(0xffc2fed1),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff96d0a6),
      onSecondaryContainer: Color(0xff000f05),
      tertiary: Color(0xffe8f0ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff98c6ff),
      onTertiaryContainer: Color(0xff000c1b),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0e150f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe4f4e5),
      outlineVariant: Color(0xffb7c7b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdce5db),
      inversePrimary: Color(0xff00532d),
      primaryFixed: Color(0xff63fea5),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff40e18b),
      onPrimaryFixedVariant: Color(0xff001508),
      secondaryFixed: Color(0xffb5f0c4),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff99d4a9),
      onSecondaryFixedVariant: Color(0xff001508),
      tertiaryFixed: Color(0xffd2e4ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff9fcaff),
      onTertiaryFixedVariant: Color(0xff001225),
      surfaceDim: Color(0xff0e150f),
      surfaceBright: Color(0xff4a524b),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1a211b),
      surfaceContainer: Color(0xff2a322c),
      surfaceContainerHigh: Color(0xff353d36),
      surfaceContainerHighest: Color(0xff414942),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
