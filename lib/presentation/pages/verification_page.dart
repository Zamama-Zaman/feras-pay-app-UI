// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:feras_pay_app/constant.dart';
import 'package:feras_pay_app/presentation/pages/home_page.dart';
import 'package:feras_pay_app/presentation/state_management/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        backgroundColor: kBackGroundColor,
        title: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Image(
              image: AssetImage('assets/app_bar.png'),
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                // "User Verification",
                localization.userVerification,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: kFontMax,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: localization.english == "English" ? 20 : 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Text(
                  // "To help keep your account safe, complete the task below",
                  localization.toHelpKeepYourAccountSafe,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kTextColor,
                  ),
                ),
              ),
              SizedBox(height: localization.english == "English" ? 20 : 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Image(
                  image: AssetImage('assets/mobile_message_notification.png'),
                ),
              ),
              SizedBox(height: localization.english == "English" ? 20 : 10),
              Text(
                // 'Enter a verification code',
                AppLocalizations.of(context)!.enterAVerificationCode,
                style: TextStyle(
                  fontSize: kFontMedium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: localization.english == "English" ? 20 : 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                ),
                child: Text(
                  // 'A text message with a verification code was just sent **** ***68',
                  localization.aTextMessageWithAverificationCodeWasJustSent,
                ),
              ),
              SizedBox(height: localization.english == "English" ? 20 : 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // "Didn't get any code? ",
                    localization.didntGetAnyCode,
                  ),
                  InkWell(
                    onTap: () {
                      // final provider =
                      //     Provider.of<LocaleProvider>(context, listen: false);
                      // if (provider.locale.toString() == 'en') {
                      //   provider.setLocale(Locale('ar'));
                      // } else if (provider.locale.toString() == 'ar') {
                      //   provider.setLocale(Locale('en'));
                      // }
                      // // provider.setLocale(Locale('en'));
                      // print(provider.locale);
                    },
                    child: Text(
                      // 'Try again',
                      localization.tryAgain,
                      style: TextStyle(
                        color: kSecondTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 15,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                width: localization.english == "English"
                    ? MediaQuery.of(context).size.width / 2.2
                    : MediaQuery.of(context).size.width / 1.8,
                height: MediaQuery.of(context).size.height / 18,
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Text(
                      'G-',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(),
                          // hintText: localization.enter6digitCode,
                          labelText: localization.enter6digitCode,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade300,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                      ),
                      BoxShadow(
                        color: Colors.pink.shade900,
                        spreadRadius: -4,
                        blurRadius: 12,
                      )
                    ],
                  ),
                  child: Text(
                    // "Confirm",
                    localization.confirm,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: checkbox,
                    onChanged: (value) {
                      setState(() {
                        if (checkbox) {
                          checkbox = false;
                        } else {
                          checkbox = true;
                        }
                      });
                    },
                  ),
                  Text(
                    // "Don't ask again on this device.",
                    localization.dontAskAgainOnThisDevice,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
