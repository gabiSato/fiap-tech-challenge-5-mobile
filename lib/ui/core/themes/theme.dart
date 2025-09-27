import "package:flutter/material.dart";

// Gerado pelo Material Theme Builder
class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006e2c),
      surfaceTint: Color(0xff006e2c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1ed760),
      onPrimaryContainer: Color(0xff005721),
      secondary: Color(0xff226c34),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa5f2ab),
      onSecondaryContainer: Color(0xff277038),
      tertiary: Color(0xff006689),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4fc7ff),
      onTertiaryContainer: Color(0xff00516e),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xffffffff),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff444748),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc4c7c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xff34e36a),
      primaryFixed: Color(0xff69ff89),
      onPrimaryFixed: Color(0xff002108),
      primaryFixedDim: Color(0xff34e36a),
      onPrimaryFixedVariant: Color(0xff00531f),
      secondaryFixed: Color(0xffa8f4ad),
      onSecondaryFixed: Color(0xff002108),
      secondaryFixedDim: Color(0xff8dd893),
      onSecondaryFixedVariant: Color(0xff00531f),
      tertiaryFixed: Color(0xffc3e8ff),
      onTertiaryFixed: Color(0xff001e2c),
      tertiaryFixedDim: Color(0xff79d1ff),
      onTertiaryFixedVariant: Color(0xff004c68),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004016),
      surfaceTint: Color(0xff006e2c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff007e33),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff004016),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff337b41),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003b51),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00759e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff111111),
      onSurfaceVariant: Color(0xff333738),
      outline: Color(0xff4f5354),
      outlineVariant: Color(0xff6a6e6e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xff34e36a),
      primaryFixed: Color(0xff007e33),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006326),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff337b41),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff15622b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff00759e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005b7c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c6c5),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xffebe7e7),
      surfaceContainerHigh: Color(0xffdfdcdb),
      surfaceContainerHighest: Color(0xffd4d1d0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003411),
      surfaceTint: Color(0xff006e2c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005520),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003411),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff005520),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003043),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004f6c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff292d2d),
      outlineVariant: Color(0xff464a4a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xff34e36a),
      primaryFixed: Color(0xff005520),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003c14),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff005520),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003c14),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004f6c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00374c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8b7),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f0ef),
      surfaceContainer: Color(0xffe5e2e1),
      surfaceContainerHigh: Color(0xffd7d4d3),
      surfaceContainerHighest: Color(0xffc9c6c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff4cf479),
      surfaceTint: Color(0xff34e36a),
      onPrimary: Color(0xff003913),
      primaryContainer: Color(0xff1ed760),
      onPrimaryContainer: Color(0xff005721),
      secondary: Color(0xff8dd893),
      onSecondary: Color(0xff003913),
      secondaryContainer: Color(0xff005520),
      onSecondaryContainer: Color(0xff7fc986),
      tertiary: Color(0xffa7deff),
      onTertiary: Color(0xff003549),
      tertiaryContainer: Color(0xff4fc7ff),
      onTertiaryContainer: Color(0xff00516e),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc4c7c8),
      outline: Color(0xff8e9192),
      outlineVariant: Color(0xff444748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff006e2c),
      primaryFixed: Color(0xff69ff89),
      onPrimaryFixed: Color(0xff002108),
      primaryFixedDim: Color(0xff34e36a),
      onPrimaryFixedVariant: Color(0xff00531f),
      secondaryFixed: Color(0xffa8f4ad),
      onSecondaryFixed: Color(0xff002108),
      secondaryFixedDim: Color(0xff8dd893),
      onSecondaryFixedVariant: Color(0xff00531f),
      tertiaryFixed: Color(0xffc3e8ff),
      onTertiaryFixed: Color(0xff001e2c),
      tertiaryFixedDim: Color(0xff79d1ff),
      onTertiaryFixedVariant: Color(0xff004c68),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff53fa7e),
      surfaceTint: Color(0xff34e36a),
      onPrimary: Color(0xff002d0d),
      primaryContainer: Color(0xff1ed760),
      onPrimaryContainer: Color(0xff003612),
      secondary: Color(0xffa2eea8),
      onSecondary: Color(0xff002d0d),
      secondaryContainer: Color(0xff58a062),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb5e3ff),
      onTertiary: Color(0xff00293a),
      tertiaryContainer: Color(0xff4fc7ff),
      onTertiaryContainer: Color(0xff003246),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdadddd),
      outline: Color(0xffafb2b3),
      outlineVariant: Color(0xff8d9191),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff005420),
      primaryFixed: Color(0xff69ff89),
      onPrimaryFixed: Color(0xff001504),
      primaryFixedDim: Color(0xff34e36a),
      onPrimaryFixedVariant: Color(0xff004016),
      secondaryFixed: Color(0xffa8f4ad),
      onSecondaryFixed: Color(0xff001504),
      secondaryFixedDim: Color(0xff8dd893),
      onSecondaryFixedVariant: Color(0xff004016),
      tertiaryFixed: Color(0xffc3e8ff),
      onTertiaryFixed: Color(0xff00131d),
      tertiaryFixedDim: Color(0xff79d1ff),
      onTertiaryFixedVariant: Color(0xff003b51),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff454444),
      surfaceContainerLowest: Color(0xff070707),
      surfaceContainerLow: Color(0xff1e1d1d),
      surfaceContainer: Color(0xff282828),
      surfaceContainerHigh: Color(0xff333232),
      surfaceContainerHighest: Color(0xff3e3d3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc2ffc4),
      surfaceTint: Color(0xff34e36a),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff2ddf67),
      onPrimaryContainer: Color(0xff000f02),
      secondary: Color(0xffc2ffc4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff89d490),
      onSecondaryContainer: Color(0xff000f02),
      tertiary: Color(0xffe1f2ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff6ccdff),
      onTertiaryContainer: Color(0xff000d15),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeef0f1),
      outlineVariant: Color(0xffc0c3c4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff005420),
      primaryFixed: Color(0xff69ff89),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff34e36a),
      onPrimaryFixedVariant: Color(0xff001504),
      secondaryFixed: Color(0xffa8f4ad),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff8dd893),
      onSecondaryFixedVariant: Color(0xff001504),
      tertiaryFixed: Color(0xffc3e8ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff79d1ff),
      onTertiaryFixedVariant: Color(0xff00131d),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff51504f),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f1f),
      surfaceContainer: Color(0xff313030),
      surfaceContainerHigh: Color(0xff3c3b3b),
      surfaceContainerHighest: Color(0xff474646),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,

    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),

    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ),

    cardTheme: CardThemeData(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.antiAlias,
      color: colorScheme.surface,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        foregroundColor: colorScheme.primary,
        textStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        side: BorderSide(color: colorScheme.outline),
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        padding: EdgeInsets.symmetric(vertical: 14),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.outline),
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        padding: EdgeInsets.symmetric(vertical: 14),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest.withOpacity(0.5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
    ),

    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceVariant.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(colorScheme.surface),
        elevation: WidgetStateProperty.all(3.0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        padding: WidgetStateProperty.all(const EdgeInsets.all(8.0)),
      ),
    ),

    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.onSurface.withOpacity(0.6);
      }),
      checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
    ),
  );

  static const customColor1 = ExtendedColor(
    seed: Color(0xff222222),
    value: Color(0xff222222),
    light: ColorFamily(
      color: Color(0xff0b0c0c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff222222),
      onColorContainer: Color(0xff8a8989),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff0b0c0c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff222222),
      onColorContainer: Color(0xff8a8989),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff0b0c0c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff222222),
      onColorContainer: Color(0xff8a8989),
    ),
    dark: ColorFamily(
      color: Color(0xffc8c6c5),
      onColor: Color(0xff303030),
      colorContainer: Color(0xff222222),
      onColorContainer: Color(0xff8a8989),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffc8c6c5),
      onColor: Color(0xff303030),
      colorContainer: Color(0xff222222),
      onColorContainer: Color(0xff8a8989),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffc8c6c5),
      onColor: Color(0xff303030),
      colorContainer: Color(0xff222222),
      onColorContainer: Color(0xff8a8989),
    ),
  );

  List<ExtendedColor> get extendedColors => [customColor1];
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
