import 'package:flutter/material.dart';

const mdcThemePrimary = Color(0xFFff95d1);
const mdcThemeOnPrimary = Color(0xFF000000);
const mdcThemeSecondary = Color(0xFF6d6dff);
const mdcThemeOnSecondary = Color(0xFFffffff);
const mdcThemeError = Color(0xFFb00020);
const mdcThemeOnError = Color(0xFFffffff);
const mdcThemeSurface = Color(0xFFffffff);
const mdcThemeOnSurface = Color(0xFF000000);
const mdcThemeBackground = Color(0xFFffffff);
const mdcTypographyFontFamily = "Oswald";
final mdcPrimarySwatch = MaterialColor(mdcThemePrimary.value, {
  50: mdcThemePrimary.withOpacity(.1),
  100: mdcThemePrimary.withOpacity(.2),
  200: mdcThemePrimary.withOpacity(.3),
  300: mdcThemePrimary.withOpacity(.4),
  400: mdcThemePrimary.withOpacity(.5),
  500: mdcThemePrimary.withOpacity(.6),
  600: mdcThemePrimary.withOpacity(.7),
  700: mdcThemePrimary.withOpacity(.8),
  800: mdcThemePrimary.withOpacity(.9),
  900: mdcThemePrimary.withOpacity(1),
});
