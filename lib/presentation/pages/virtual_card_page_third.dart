// ignore_for_file: prefer_const_constructors

import 'package:feras_pay_app/presentation/screens/sign_in_screen.dart';
import 'package:feras_pay_app/presentation/widgets/app_bar_widget.dart';
import 'package:feras_pay_app/presentation/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class VirtualCardPageThird extends StatelessWidget {
  const VirtualCardPageThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: appBarWidget(context),
      drawer: drawerWidget(context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_circle_sharp,
                size: 150,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Anothony Joshua",
              style: TextStyle(
                color: kTextColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Text(
              // "Do you want to sign out from FerasPay?",
              localization.doYouWantToSignOutFrom,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kTextColor.withOpacity(.6),
                fontSize: 25,
              ),
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                    (route) => false);
              },
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
                child: Text(
                  // "Sign Out",
                  localization.signOut,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
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
