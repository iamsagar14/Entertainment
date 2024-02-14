import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ratamata/audio_detail_view.dart';
import 'package:ratamata/change_language.dart';
import 'package:ratamata/dashboard_view.dart';
import 'package:ratamata/generated/locales.g.dart';
import 'package:ratamata/youtubeplayerpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translations,
      locale: const Locale('en', 'Us'),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DetailAudioPage(),
    );
  }
}
