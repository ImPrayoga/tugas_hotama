import 'package:flutter/material.dart';
import 'package:whatsapp/fitur/exstension/Costum_extention.dart';

class CostumIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;
  final double? iconsize;
  final double? minWidth;

  const CostumIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconColor,
    this.iconsize,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      splashColor: Colors.transparent,
      splashRadius: 22,
      iconSize: iconsize ?? 22,
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(minWidth: minWidth ?? 40),
      icon: Icon(
        icon,
        color: iconColor ?? context.theme.greyColor,
      ),
    );
  }
}
