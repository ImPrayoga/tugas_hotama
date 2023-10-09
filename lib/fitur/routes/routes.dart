import 'package:flutter/material.dart';
import 'package:whatsapp/fitur/page/login.dart';
import 'package:whatsapp/fitur/page/user_info.dart';
import 'package:whatsapp/fitur/page/verification.dart';
import 'package:whatsapp/fitur/page/welcome_page.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String userInfo = 'user-info';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (context) => const Welcomepage(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const Loginpage(),
        );
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => VerificationPage(
            smsCodeId: args['verificationId'],
            phoneNumber: args['phoneNumber'],
          ),
        );
      case userInfo:
        return MaterialPageRoute(
          builder: (context) => const Userinfo(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No Page Route Provider'),
            ),
          ),
        );
    }
  }
}
