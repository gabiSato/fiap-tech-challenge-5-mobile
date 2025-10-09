import "package:flutter/material.dart";

// Gerado pelo Material Theme Builder
class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF386A20),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFB7F397),
      onPrimaryContainer: Color(0xFF042100),
      secondary: Color(0xFF56624B),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFDAE7C9),
      onSecondaryContainer: Color(0xFF141E0C),
      tertiary: Color(0xFF386666),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFBBEBEB),
      onTertiaryContainer: Color(0xFF002020),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      surface: Color(0xFFFDFCF5),
      onSurface: Color(0xFF1A1C18),
      surfaceContainerHighest: Color(0xFFE1E4D5),
      onSurfaceVariant: Color(0xFF45483F),
      outline: Color(0xFF75796E),
      onInverseSurface: Color(0xFFF1F1E9),
      inverseSurface: Color(0xFF2F312C),
      inversePrimary: Color(0xFF9CD67E),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF386A20),
      outlineVariant: Color(0xFFC5C8BA),
      scrim: Color(0xFF000000),
      surfaceContainer: Color(0xFFEEF1E6),
      surfaceBright: Color(0xFFFDFCF5),
      surfaceDim: Color(0xFFDDE0D3),
      surfaceContainerLow: Color(0xFFF4F6E9),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerHigh: Color(0xFFE8EBE0),
      primaryFixed: Color(0xFFB7F397),
      onPrimaryFixed: Color(0xFF042100),
      primaryFixedDim: Color(0xFF9CD67E),
      onPrimaryFixedVariant: Color(0xFF1F5107),
      secondaryFixed: Color(0xFFDAE7C9),
      onSecondaryFixed: Color(0xFF141E0C),
      secondaryFixedDim: Color(0xFFBECBAE),
      onSecondaryFixedVariant: Color(0xFF3F4B35),
      tertiaryFixed: Color(0xFFBBEBEB),
      onTertiaryFixed: Color(0xFF002020),
      tertiaryFixedDim: Color(0xFFA0CFCF),
      onTertiaryFixedVariant: Color(0xFF1F4E4E),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF9CD67E),
      onPrimary: Color(0xFF1F5107),
      primaryContainer: Color(0xFF205107),
      onPrimaryContainer: Color(0xFFB7F397),
      secondary: Color(0xFFBECBAE),
      onSecondary: Color(0xFF293420),
      secondaryContainer: Color(0xFF3F4B35),
      onSecondaryContainer: Color(0xFFDAE7C9),
      tertiary: Color(0xFFA0CFCF),
      onTertiary: Color(0xFF003737),
      tertiaryContainer: Color(0xFF1F4E4E),
      onTertiaryContainer: Color(0xFFBBEBEB),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: Color(0xFF1A1C18),
      onSurface: Color(0xFFE3E3DC),
      surfaceContainerHighest: Color(0xFF45483F),
      onSurfaceVariant: Color(0xFFC5C8BA),
      outline: Color(0xFF8F9287),
      onInverseSurface: Color(0xFF1A1C18),
      inverseSurface: Color(0xFFE3E3DC),
      inversePrimary: Color(0xFF386A20),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF9CD67E),
      outlineVariant: Color(0xFF45483F),
      scrim: Color(0xFF000000),
      surfaceContainer: Color(0xFF23271F),
      surfaceBright: Color(0xFF363831),
      surfaceDim: Color(0xFF12140F),
      surfaceContainerLow: Color(0xFF1E201A),
      surfaceContainerLowest: Color(0xFF0D0F0A),
      surfaceContainerHigh: Color(0xFF2D3029),
      primaryFixed: Color(0xFFB7F397),
      onPrimaryFixed: Color(0xFF042100),
      primaryFixedDim: Color(0xFF9CD67E),
      onPrimaryFixedVariant: Color(0xFF1F5107),
      secondaryFixed: Color(0xFFDAE7C9),
      onSecondaryFixed: Color(0xFF141E0C),
      secondaryFixedDim: Color(0xFFBECBAE),
      onSecondaryFixedVariant: Color(0xFF3F4B35),
      tertiaryFixed: Color(0xFFBBEBEB),
      onTertiaryFixed: Color(0xFF002020),
      tertiaryFixedDim: Color(0xFFA0CFCF),
      onTertiaryFixedVariant: Color(0xFF1F4E4E),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
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
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.outline),
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainer,
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
        fillColor: colorScheme.surfaceContainer,
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
        return colorScheme.onSurface.withAlpha(153);
      }),
      checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
    ),
  );
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
