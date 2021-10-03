import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/language_const.dart';
import 'package:flutter_localization/string_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      child: const MyApp(),
      supportedLocales: const [
        Locale(LanguageCode.en),
        Locale(LanguageCode.ru),
        Locale(LanguageCode.pl)
      ],
      useOnlyLangCode: true,
      fallbackLocale: const Locale(LanguageCode.en),
      path: LANGUAGE_ASSETS_PATH));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(StringKey.HELLO.tr()),
                Text(StringKey.NAME.tr(args: ["Ivan", "17"])),
                Text(StringKey.GENDER.tr(gender: Genders.MALE)),
              ]),
        ),
      );
}
