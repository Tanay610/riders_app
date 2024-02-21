import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riders_app/view/pages/profile_page.dart';

import 'view/pages/splash_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized(); 
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'),],
      path: 'assets/locales',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(), 
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
