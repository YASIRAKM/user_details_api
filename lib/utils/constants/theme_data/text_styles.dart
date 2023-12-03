import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';


class MyTextStyles{
  static TextStyle appBarText=GoogleFonts.playfairDisplay(color: AppColor.appBarTextColor,fontSize: 30);
  static TextStyle userListName =GoogleFonts.abel(color: AppColor.bodyTextColor,fontSize: 20,fontWeight: FontWeight.w900);
  static TextStyle userListNumber =GoogleFonts.abel(color: AppColor.bodyTextColor,fontSize:54,fontWeight: FontWeight.w900);
  static TextStyle userListEmail =GoogleFonts.actor(color: AppColor.bodyTextColor,fontSize: 15,fontWeight: FontWeight.w600);
  static TextStyle userTapText =GoogleFonts.actor(color: AppColor.appBarTextColor,fontSize: 15,fontWeight: FontWeight.w600);

}