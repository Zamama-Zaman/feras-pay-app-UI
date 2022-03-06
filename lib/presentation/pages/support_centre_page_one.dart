// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:feras_pay_app/presentation/pages/support_centre_page_second.dart';
import 'package:feras_pay_app/presentation/widgets/app_bar_widget.dart';
import 'package:feras_pay_app/presentation/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class SupportCentrePageOne extends StatelessWidget {
  const SupportCentrePageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: appBarWidget(context),
      drawer: drawerWidget(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                Text(
                  // 'Support Center',
                  localization.supportCenter,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 50),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                // 'Please tell about your complain',
                localization.pleaseTellAboutYourComplain,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3.5,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kSecondTextColor),
              ),
              child: TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  // hintText: 'Write here',
                  hintText: localization.writeHere,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SupporCentrePageSecond(),
                    ));
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  // alignment: Alignment.center,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send_sharp,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        // "Send Complain",
                        localization.sendComplain,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
