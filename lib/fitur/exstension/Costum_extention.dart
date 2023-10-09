import 'package:flutter/material.dart';
import 'package:whatsapp/fitur/widget/warna.dart';

extension ExtendedTheme on BuildContext {
  CostumExtension get theme {
    return Theme.of(this).extension<CostumExtension>()!;
  }
}

class CostumExtension extends ThemeExtension<CostumExtension> {
  static const lightMode = CostumExtension(
    circleImageColor: Color(0xFF25D366),
    greyColor: warna.abumuda,
    blueColor: warna.birumuda,
    langBtnbgColor: Color(0xFFF7F8FA),
    langBtnHighlightColor: Color(0xFFE8E8ED),
    authAppbarTextColor: warna.hijaumuda,
    photoIconBgColor: Color(0xFFF0F2F3),
    photoIconColor: Color(0xFF9DAAB3),
  );
  static const darkMode = CostumExtension(
    circleImageColor: warna.hijautua,
    greyColor: warna.abutua,
    blueColor: warna.birutua,
    langBtnbgColor: Color(0xFF182229),
    langBtnHighlightColor: Color(0xFF09141A),
    authAppbarTextColor: Color(0xFFE9EDEF),
    photoIconBgColor: Color(0xFF283339),
    photoIconColor: Color(0xFF61717B),

  );
  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBtnbgColor;
  final Color? langBtnHighlightColor;
  final Color? authAppbarTextColor;
  final Color? photoIconBgColor;
  final Color? photoIconColor;

  const CostumExtension( {
    required this.authAppbarTextColor,
    required this.circleImageColor,
    required this.greyColor,
    required this.blueColor,
    required this.langBtnbgColor,
    required this.langBtnHighlightColor,
   this.photoIconBgColor, 
   this.photoIconColor,
  });

  @override
  ThemeExtension<CostumExtension> copyWith({
    Color? circleImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? langBtnbgColor,
    Color? langBtnHighlightColor,
    Color? authAppbarTextColor,
    Color? photoIconBgColor,
    Color? photoIconColor,
  }) {
    return CostumExtension(
        circleImageColor: circleImageColor ?? this.circleImageColor,
        greyColor: greyColor ?? this.greyColor,
        authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
        photoIconBgColor:photoIconBgColor ?? this.photoIconBgColor,
         photoIconColor:photoIconColor ?? this.photoIconColor,
        blueColor: blueColor ?? this.blueColor,
        langBtnbgColor: langBtnbgColor ?? this.langBtnbgColor,
        langBtnHighlightColor:
            langBtnHighlightColor ?? this.langBtnHighlightColor);
  }

  @override
  ThemeExtension<CostumExtension> lerp(
      covariant ThemeExtension<CostumExtension>? other, double t) {
    if (other is! CostumExtension) return this;
    return CostumExtension(
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
         photoIconColor: Color.lerp( photoIconColor, other. photoIconColor, t),
      langBtnbgColor: Color.lerp(langBtnbgColor, other.langBtnbgColor, t),
      authAppbarTextColor:
          Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
      langBtnHighlightColor:
          Color.lerp(langBtnHighlightColor, other.langBtnHighlightColor, t),
    );
  }
}
