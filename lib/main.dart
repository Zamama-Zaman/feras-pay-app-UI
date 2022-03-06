// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:feras_pay_app/l10n/l10n.dart';
import 'package:feras_pay_app/presentation/pages/account_page.dart';
import 'package:feras_pay_app/presentation/pages/add_money_page.dart';
import 'package:feras_pay_app/presentation/pages/add_money_successful_page.dart';
import 'package:feras_pay_app/presentation/pages/buy_gift_card_page_one.dart';
import 'package:feras_pay_app/presentation/pages/buy_gift_card_page_second.dart';
import 'package:feras_pay_app/presentation/pages/buy_gift_card_page_third.dart';
import 'package:feras_pay_app/presentation/pages/home_page.dart';
import 'package:feras_pay_app/presentation/pages/profile_page.dart';
import 'package:feras_pay_app/presentation/pages/send_money_page.dart';
import 'package:feras_pay_app/presentation/pages/send_money_page_second.dart';
import 'package:feras_pay_app/presentation/pages/setting_page_one.dart';
import 'package:feras_pay_app/presentation/pages/setting_page_third.dart';
import 'package:feras_pay_app/presentation/pages/settings_page_second.dart';
import 'package:feras_pay_app/presentation/pages/virtual_card_page_one.dart';
import 'package:feras_pay_app/presentation/pages/virtual_card_page_second.dart';
import 'package:feras_pay_app/presentation/pages/virtual_card_page_third.dart';
import 'package:feras_pay_app/presentation/screens/sign_in_screen.dart';
import 'package:feras_pay_app/presentation/state_management/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'presentation/pages/verification_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // static final String title = 'Localization';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          return MaterialApp(
            title: 'FerasPay',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.pink,
            ),
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: const SignInScreen(),
          );
        });
  }
}
