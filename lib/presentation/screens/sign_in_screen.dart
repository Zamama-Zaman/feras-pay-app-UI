// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:feras_pay_app/presentation/pages/verification_page.dart';
import 'package:feras_pay_app/presentation/screens/sign_up_screen.dart';
import 'package:feras_pay_app/presentation/state_management/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _changeLanguage = true;

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: localization.english == "English" ? 30 : 10,
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/Sign In.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.7,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _changeLanguage = false;
                          final provider = Provider.of<LocaleProvider>(context,
                              listen: false);
                          provider.setLocale(Locale('ar'));
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.7,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: _changeLanguage ? Colors.black : Colors.pink,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            localization.arabic,
                            style: TextStyle(
                              color:
                                  _changeLanguage ? Colors.black : Colors.pink,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _changeLanguage = true;
                            final provider = Provider.of<LocaleProvider>(
                                context,
                                listen: false);
                            provider.setLocale(Locale('en'));
                          },
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.7,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: _changeLanguage ? Colors.pink : Colors.black,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            localization.english,
                            style: TextStyle(
                              color:
                                  _changeLanguage ? Colors.pink : Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: localization.english == "English"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Text(
                    localization.email,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: localization.contactInfo,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: localization.english == "English"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Text(
                    localization.password,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      border: InputBorder.none,
                      hintText: "xxxxxxxx",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      // final provider =
                      //     Provider.of<LocaleProvider>(context, listen: false);
                      // // provider.setLocale(Locale('en'));
                      // if (provider.locale.toString() == 'en') {
                      //   provider.setLocale(Locale('ar'));
                      // } else if (provider.locale.toString() == 'ar') {
                      //   provider.setLocale(Locale('en'));
                      // }
                      // // provider.setLocale(Locale('en'));
                      // print(provider.locale);
                    },
                    child: Text(
                      localization.forgotPassword,
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationPage(),
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
                      localization.signIn,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  localization.or,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fingerprint,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      localization.useFingerPrint,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _changeLanguage ? 20 : 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(localization.newToFerasPay),
                    SizedBox(
                      width: 0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                            (route) => false);
                      },
                      child: Text(
                        localization.createAccount,
                        style: TextStyle(
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
