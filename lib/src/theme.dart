import 'package:flutter/material.dart';
import 'package:stockholm/src/colors.dart';

class StockholmThemeData {
  static ThemeData light(
      {StockholmColor? accentColor, String? fontFamily, bool? useMaterial3}) {
    var theme = ThemeData(
        brightness: Brightness.light,
        fontFamily: fontFamily,
        useMaterial3: useMaterial3);
    var colors = StockholmColors.fromBrightness(Brightness.light);
    accentColor ??= colors.blue;

    theme = _applySharedChanges(theme);

    return theme.copyWith(
        // primaryColorBrightness: Brightness.light,
        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.compact,
        primaryColor: accentColor,
        indicatorColor: accentColor,
        highlightColor: Colors.black26,
        disabledColor: Colors.black26,
        popupMenuTheme: theme.popupMenuTheme.copyWith(
          textStyle: theme.textTheme.bodyMedium,
          color: Colors.grey.shade100,
        ),
        dialogTheme: theme.dialogTheme.copyWith(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              side: BorderSide(color: Colors.black12, width: 1.0),
            )),
        textTheme: theme.textTheme.copyWith(
          bodySmall: theme.textTheme.bodySmall!.copyWith(color: Colors.black38),
        ),
        iconTheme: theme.iconTheme.copyWith(
          color: Colors.grey[700],
        ),
        colorScheme: theme.colorScheme.copyWith(
          primary: accentColor,
          secondary: accentColor.contrast,
          background: Colors.blueGrey[50],
        ));
  }

  static ThemeData dark(
      {StockholmColor? accentColor, String? fontFamily, bool? useMaterial3}) {
    var theme = ThemeData(
        brightness: Brightness.dark,
        fontFamily: fontFamily,
        useMaterial3: useMaterial3);

    var colors = StockholmColors.fromBrightness(Brightness.dark);
    accentColor ??= colors.blue;

    theme = _applySharedChanges(theme);

    return theme.copyWith(
        primaryColor: accentColor,
        popupMenuTheme: theme.popupMenuTheme.copyWith(
          textStyle: theme.textTheme.bodyMedium,
          color: Colors.grey.shade900,
        ),
        indicatorColor: accentColor,
        scaffoldBackgroundColor: Colors.grey[900],
        canvasColor: const Color.fromRGBO(38, 38, 38, 1.0),
        hoverColor: Colors.white12,
        cardColor: Colors.grey[900],
        dividerColor: Colors.white24,
        dialogTheme: theme.dialogTheme.copyWith(
          backgroundColor: const Color.fromRGBO(44, 44, 44, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: Colors.grey[700]!, width: 1.0),
          ),
        ),
        colorScheme: theme.colorScheme.copyWith(
          primary: accentColor,
          secondary: accentColor.contrast,
          background: const Color.fromRGBO(44, 44, 44, 1.0),
        ));
  }

  static ThemeData _applySharedChanges(ThemeData theme) {
    return theme.copyWith(
      visualDensity: VisualDensity.compact,
      textTheme: theme.textTheme.copyWith(
        bodyLarge: theme.textTheme.bodyLarge!.copyWith(fontSize: 13.0),
        bodyMedium: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.0),
        titleMedium: theme.textTheme.bodyLarge!
            .copyWith(fontSize: 13.0, fontWeight: FontWeight.bold),
        titleSmall: theme.textTheme.bodyMedium!
            .copyWith(fontSize: 12.0, fontWeight: FontWeight.bold),
        bodySmall: theme.textTheme.bodySmall!
            .copyWith(fontSize: 10.5, fontWeight: FontWeight.bold),
        labelLarge: theme.textTheme.labelLarge!.copyWith(fontSize: 14.0),
      ),
      splashColor: Colors.transparent,
    );
  }
}
