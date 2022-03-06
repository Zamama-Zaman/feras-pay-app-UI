// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:feras_pay_app/presentation/pages/home_page.dart';
import 'package:feras_pay_app/presentation/widgets/app_bar_widget.dart';
import 'package:feras_pay_app/presentation/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class BuyGiftCardPageThrid extends StatelessWidget {
  const BuyGiftCardPageThrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: appBarWidget(context),
      drawer: drawerWidget(context),
      body: Padding(
        padding: localization.english == "English"
            ? const EdgeInsets.symmetric(horizontal: 60.0)
            : const EdgeInsets.symmetric(horizontal: 60.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              // "Buy Gift Card",
              localization.buyGiftCard,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 150,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage('assets/images/detail_card_2.jpg'),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              // "Successfull",
              localization.successfully,
              style: TextStyle(
                fontSize: 20,
                color: kTextHeadingColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              // "You have Successfully purchased a \u0024XX.XX Gift Card",
              localization.youHaveSuccessfullyPurchase,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kTextColor.withOpacity(.6),
                fontSize: 20,
              ),
            ),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                // text: "Your new balance is ",
                text: localization.yourNewBalanceIs,
                style: TextStyle(
                  color: kTextColor.withOpacity(.6),
                  fontSize: 20,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "\u0024XXX.XX",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
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
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
