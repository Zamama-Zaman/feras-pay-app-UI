// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:feras_pay_app/presentation/pages/setting_page_third.dart';
import 'package:feras_pay_app/presentation/pages/settings_page_second.dart';
import 'package:feras_pay_app/presentation/state_management/local.dart';
import 'package:feras_pay_app/presentation/widgets/app_bar_widget.dart';
import 'package:feras_pay_app/presentation/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class SettingPageOne extends StatelessWidget {
  const SettingPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: appBarWidget(context),
      drawer: drawerWidget(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.4,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: kSecondTextColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Change your name",
                    localization.changeYourName,
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(height: localization.english == "English" ? 10 : 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.6,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: kSecondTextColor.withOpacity(.4),
                          border: Border.all(color: kSecondTextColor),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text(
                              // "Write your new name",
                              localization.wrietYourNewName,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kThirdTextColor,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingPageSecond(),
                                ));
                          },
                          child: Text(
                            "OK",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: localization.english == "English" ? 30 : 20),
                  Text(
                    // "Change password",
                    localization.changePassword,
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(height: localization.english == "English" ? 10 : 8),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: kSecondTextColor.withOpacity(.4),
                      border: Border.all(color: kSecondTextColor),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text(
                          // "Write old password",
                          localization.writeOldPassword,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: localization.english == "English" ? 10 : 8),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: kSecondTextColor.withOpacity(.4),
                      border: Border.all(color: kSecondTextColor),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text(
                          // "Write new password",
                          localization.writeNewPassword,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: localization.english == "English" ? 20 : 15),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent.shade200,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                          ),
                          BoxShadow(
                            color: Colors.purpleAccent.shade700,
                            spreadRadius: -4,
                            blurRadius: 12,
                          )
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingPageThird(),
                            ),
                          );
                        },
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
                  ),
                  SizedBox(height: localization.english == "English" ? 30 : 10),
                  Text(
                    // "Change language",
                    localization.changeLanguage,
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(height: localization.english == "English" ? 10 : 8),
                  //TODO: Make it ListView
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          final provider = Provider.of<LocaleProvider>(context,
                              listen: false);
                          provider.setLocale(Locale('en'));
                        },
                        child: Container(
                          width: 130,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: kSecondTextColor),
                          ),
                          child: Text(
                            // "English",
                            localization.english,
                            style: TextStyle(
                              fontSize: 24,
                              color: kSecondTextColor,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final provider = Provider.of<LocaleProvider>(context,
                              listen: false);
                          provider.setLocale(Locale('ar'));
                        },
                        child: Container(
                          width: 130,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text(
                            // "Arabic",
                            localization.arabic,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.shade200,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                  ),
                  BoxShadow(
                    color: Colors.purpleAccent.shade700,
                    spreadRadius: -4,
                    blurRadius: 12,
                  )
                ],
              ),
              child: Text(
                // "Go to home page",
                localization.goToHomePage,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
