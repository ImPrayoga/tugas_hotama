import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/fitur/exstension/Costum_extention.dart';
import 'package:whatsapp/fitur/widget/warna.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
   backgroundColor:warna.latartua,
   scaffoldBackgroundColor: warna.latartua,
   extensions: [
    CostumExtension.darkMode
   ],
appBarTheme: AppBarTheme(
  titleTextStyle:TextStyle(fontSize: 18) ,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ),

),
   elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
          backgroundColor: warna.hijautua,
              foregroundColor: warna.latartua,
              splashFactory: NoSplash.splashFactory,
              elevation: 0,
              shadowColor: Colors.transparent),
    ),
   bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: warna.abugelap,
    modalBackgroundColor: warna.abugelap,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    )

   ),
   dialogBackgroundColor: warna.latartua,
   dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
   ),
  );
}
