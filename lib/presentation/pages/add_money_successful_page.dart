// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:feras_pay_app/constant.dart';
import 'package:feras_pay_app/presentation/pages/home_page.dart';
import 'package:feras_pay_app/presentation/widgets/app_bar_widget.dart';
import 'package:feras_pay_app/presentation/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AddMoneySuccessFulPage extends StatefulWidget {
  const AddMoneySuccessFulPage({Key? key}) : super(key: key);

  @override
  _AddMoneySuccessFulPageState createState() => _AddMoneySuccessFulPageState();
}

class _AddMoneySuccessFulPageState extends State<AddMoneySuccessFulPage> {
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: appBarWidget(context),
      drawer: drawerWidget(context),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            // 'Add Money',
            localization.addMoney,
            style: TextStyle(
              color: kTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 70),
          Text(
            // 'Successfull',
            localization.successfully,
            style: TextStyle(
              color: Colors.lightBlueAccent.shade400,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              "You have Successfully added \u0024108.63 on your account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // "Your new balance is ",
                localization.yourNewBalacne + " ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "\u0024108.63",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                  (route) => false);
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: MediaQuery.of(context).size.width / 1.5,
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
                localization.goToHomePage + " ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
