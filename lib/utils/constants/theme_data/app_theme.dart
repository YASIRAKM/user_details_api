import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: AppColor.appBarColor,
      centerTitle: true,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
      titleTextStyle: MyTextStyles.appBarText,
      elevation: 1,
      iconTheme: IconThemeData(color: AppColor.iconColor),
      titleSpacing: 2,
    ),
    iconTheme: IconThemeData(
        color: AppColor.iconColor, size: 30, weight: 30),
    cardTheme: CardTheme(
        color: AppColor.cardColor,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(0))),
    brightness:Brightness.dark,
    dividerTheme: DividerThemeData(color: AppColor.dividerColor,thickness: 2,),



  );
}
