import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/firebase_options.dart';
import 'package:whatsapp/fitur/page/user_info.dart';
import 'package:whatsapp/fitur/page/welcome_page.dart'; // Sesuaikan nama impor dengan benar
import 'package:whatsapp/fitur/routes/routes.dart';

import 'package:whatsapp/fitur/tema/dark.dart';
import 'package:whatsapp/fitur/tema/white.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Menggunakan WidgetsFlutterBinding.ensureInitialized() untuk menginisialisasi FlutterBinding.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Memperbaiki deklarasi constructor.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp', // Memperbaiki judul aplikasi.
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const Welcomepage(), // Sesuaikan nama kelas dengan benar.
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
