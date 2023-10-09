import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import ini untuk inputFormatters
import 'package:whatsapp/fitur/exstension/Costum_extention.dart';
import 'package:whatsapp/fitur/widget/warna.dart';

class Mytextfield extends StatelessWidget {
  const Mytextfield({
    super.key,
    this.controller,
    this.hintText,
    this.readOnly,
    this.textAlign,
    this.keyboardType,
    this.prefixText,
    this.onTap,
    this.suffixIcon,
    this.onChanged,
    this.allowOnlyNumbers = false,
    this.fontSize, this.autoFocus, // Menambah properti allowOnlyNumbers
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final String? prefixText;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final double? fontSize;
  final bool? autoFocus;
  final bool allowOnlyNumbers; // Menambah properti allowOnlyNumbers

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> inputFormatters = [];
    if (allowOnlyNumbers) {
      // Menambahkan input formatter jika hanya angka yang diizinkan
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    return TextFormField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.center,
      keyboardType: readOnly == null ? keyboardType : null,
      onChanged: onChanged,
      style: TextStyle(fontSize: fontSize),
      autofocus: autoFocus?? false,
      inputFormatters: inputFormatters, // Menggunakan inputFormatters
      decoration: InputDecoration(
        isDense: true,
        prefixText: prefixText,
        suffix: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: context.theme.greyColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: warna.hijautua),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: warna.hijautua, width: 2),
        ),
      ),
      enabled: allowOnlyNumbers ? true : null, // Menggunakan properti enabled
    );
  }
}
