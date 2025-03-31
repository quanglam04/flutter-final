import 'package:flutter/material.dart';

class AppThemeData {
  AppThemeData({
    this.textTheme,
    this.colorSchema,
  });

  final AppTextTheme? textTheme;
  final AppColorSchema? colorSchema;
}

class AppTextTheme {
  AppTextTheme({
    this.textSmall,
    this.textXSmall,
    this.textMedium,
    this.textLarge,
    this.textDisplaySmall,
    this.textDisplayMedium,
    this.textDisplayLarge,
    this.textDisplaySmallBold,
    this.textDisplayMediumBold,
    this.textDisplayLargeBold,
    this.textSmallLink,
    this.textXSmallLink,
    this.textMediumLink,
    this.textLargeLink,


    this.h1,
    this.h2,
    this.h3,
    this.primary,
    this.medium,
    this.small,
    this.highlightsMedium,
    this.highlightsBold,
    this.button,
    this.title,
    this.header,
    this.title2,
    this.title3,
  });

  final TextStyle? textSmall;
  final TextStyle? textXSmall;
  final TextStyle? textMedium;
  final TextStyle? textLarge;
  final TextStyle? textDisplaySmall;
  final TextStyle? textDisplayMedium;
  final TextStyle? textDisplayLarge;
  final TextStyle? textDisplaySmallBold;
  final TextStyle? textDisplayMediumBold;
  final TextStyle? textDisplayLargeBold;
  final TextStyle? textSmallLink;
  final TextStyle? textXSmallLink;
  final TextStyle? textMediumLink;
  final TextStyle? textLargeLink;


  final TextStyle? h1;
  final TextStyle? h2;
  final TextStyle? h3;
  final TextStyle? primary;
  final TextStyle? medium;
  final TextStyle? small;
  final TextStyle? highlightsMedium;
  final TextStyle? highlightsBold;
  final TextStyle? button;
  final TextStyle? title;
  final TextStyle? header;
  final TextStyle? title2;
  final TextStyle? title3;

}

class AppColorSchema {
  AppColorSchema({
    this.primary,
    this.mainText,
    this.subText,
    this.whiteText,
    this.disableText,
    this.border,
    this.background,
    this.barrierColor,
    this.secondary1,
    this.secondary2,
    this.secondary3,
    this.secondary4,
    this.badgeColor,
    this.title2,


    this.darkBlack,
    this.successDefault,
    this.successDark,
    this.successDarkmode,
    this.successLight,
    this.errorDefault,
    this.errorDark,
    this.errorDarkmode,
    this.errorLight,
    this.warningDefault,
    this.warningDark,
    this.warningDarkmode,
    this.primaryDefault,
    this.grayscaleWhite,
    this.grayscaleTitleactive,
    this.grayscaleDisableInput,
    this.grayscaleBodyText,
    this.grayscalePlaceholder,
    this.grayscaleSecondaryButton,
    this.grayscaleButtonText,
    this.darkmodeBackground,
    this.darkmodeTitle,
    this.darkmodeBody,
    this.darkmodeInputBackground,
  });

  final Color? primary;
  final Color? mainText;
  final Color? subText;
  final Color? whiteText;
  final Color? disableText;
  final Color? secondary1;
  final Color? secondary2;
  final Color? secondary3;
  final Color? secondary4;
  final Color? border;
  final Color? background;
  final Color? barrierColor;
  final Color? badgeColor;
  final Color? title2;

  final Color? successDefault;
  final Color? successDark;
  final Color? darkBlack;
  final Color? successDarkmode;
  final Color? successLight;
  final Color? errorDefault;
  final Color? errorDark;
  final Color? errorDarkmode;
  final Color? errorLight;
  final Color? warningDefault;
  final Color? warningDark;
  final Color? warningDarkmode;
  final Color? primaryDefault;
  final Color? grayscaleWhite;
  final Color? grayscaleTitleactive;
  final Color? grayscaleDisableInput;
  final Color? grayscaleBodyText;
  final Color? grayscalePlaceholder;
  final Color? grayscaleSecondaryButton;
  final Color? grayscaleButtonText;
  final Color? darkmodeBackground;
  final Color? darkmodeTitle;
  final Color? darkmodeBody;
  final Color? darkmodeInputBackground;
}
