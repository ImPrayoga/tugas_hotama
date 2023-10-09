import 'package:flutter/material.dart';
import 'package:whatsapp/fitur/exstension/Costum_extention.dart';
import 'package:whatsapp/fitur/widget/icon_button.dart';
import 'package:whatsapp/fitur/widget/warna.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });
  showBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                    color: context.theme.greyColor!.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 20),
                   CostumIconButton(onTap:() => Navigator.of(context).pop(), icon: Icons.close_outlined),
                    const SizedBox(width: 10),
                    const Text(
                      'App language',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: context.theme.greyColor!.withOpacity(0.3),
                  thickness: 5,
                ),
                RadioListTile(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {},
                  activeColor: warna.hijautua,
                  title: const Text('English'),
                  subtitle: Text(
                    "(phone's language)",
                    style: TextStyle(color: context.theme.greyColor),
                  ),
                ),
                RadioListTile(
                  value: true,
                  groupValue: false,
                  onChanged: (value) {},
                  activeColor: warna.hijautua,
                  title: const Text('Afrikaans'),
                  subtitle: Text(
                    "(Afrikaans)",
                    style: TextStyle(color: context.theme.greyColor),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBtnbgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => showBottomSheet(context),
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.theme.langBtnHighlightColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.language,
                color: warna.hijautua,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'English',
                style: TextStyle(color: warna.hijautua),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: warna.hijautua,
              )
            ],
          ),
        ),
      ),
    );
  }
}
