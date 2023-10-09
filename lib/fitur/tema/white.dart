import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/fitur/exstension/Costum_extention.dart';
import 'package:whatsapp/fitur/widget/warna.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
   backgroundColor:warna.latarmuda,
   scaffoldBackgroundColor: warna.latarmuda,
   extensions: [
    CostumExtension.lightMode,
   ],
   appBarTheme: AppBarTheme(
     titleTextStyle:TextStyle(fontSize: 18) ,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ),
   ),
   elevatedButtonTheme: ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
              backgroundColor: warna.hijaumuda,
              foregroundColor: warna.latarmuda,
              splashFactory: NoSplash.splashFactory,
              elevation: 0,
              shadowColor: Colors.transparent),
   ),
    bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: warna.latarmuda,
    modalBackgroundColor: warna.latarmuda,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    )

   ),
    dialogBackgroundColor: warna.latarmuda,
   dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
   ),
  );
}
