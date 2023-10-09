import 'package:flutter/material.dart';
import 'package:whatsapp/fitur/exstension/Costum_extention.dart';
import 'package:whatsapp/fitur/routes/routes.dart';
import 'package:whatsapp/fitur/widget/costum_elevatedbutton.dart';
import 'package:whatsapp/fitur/widget/language_button.dart';
import 'package:whatsapp/fitur/widget/privacy.dart';
// Import file yang mengandung definisi latar

class Welcomepage extends StatelessWidget {
  const Welcomepage({Key? key});

  navigateToLoginPage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Image.asset(
                'assets/images/circle.png',
                color: context.theme.circleImageColor,
              ),
            ),
          )),
          SizedBox(
            height: 40,
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                'Welcome to WhatsApp',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const PrivacyAndTerms(),
              Costum_Elevated(
                onPressed: () => navigateToLoginPage(context),
                text: "AGREE AND CONTINUE",
              ),
              SizedBox(
                height: 50,
              ),
              LanguageButton()
            ],
          ))
        ],
      ),
    );
  }
}
