// ignore_for_file: prefer_const_constructors

import 'package:feras_pay_app/presentation/pages/add_money_page.dart';
import 'package:feras_pay_app/presentation/pages/buy_gift_card_page_one.dart';
import 'package:feras_pay_app/presentation/pages/home_page.dart';
import 'package:feras_pay_app/presentation/pages/profile_page.dart';
import 'package:feras_pay_app/presentation/pages/send_money_page.dart';
import 'package:feras_pay_app/presentation/pages/setting_page_one.dart';
import 'package:feras_pay_app/presentation/pages/support_centre_page_one.dart';
import 'package:feras_pay_app/presentation/pages/virtual_card_page_one.dart';
import 'package:feras_pay_app/presentation/pages/virtual_card_page_third.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

Drawer drawerWidget(context) {
  var currentPage = DrawerSection.home;
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          drawerList(context, currentPage),
        ],
      ),
    ),
  );
}

Widget drawerList(context, currentPage) {
  var localization = AppLocalizations.of(context)!;
  return Column(
    children: [
      menuItem(
        context,
        1,
        // 'Home',
        localization.home,
        Icons.home,
        currentPage == DrawerSection.home ? true : false,
        currentPage,
      ),
      menuItem(
        context,
        2,
        // 'Profile',
        localization.profile,
        Icons.person,
        currentPage == DrawerSection.profile ? true : false,
        currentPage,
      ),
      menuItem(
        context,
        3,
        // 'Add Money',
        localization.addMoney,
        Icons.money,
        currentPage == DrawerSection.addMoney ? true : false,
        currentPage,
      ),
      menuItem(
        context,
        4,
        // 'Send Money',
        localization.sendMoney,
        Icons.send,
        currentPage == DrawerSection.sendMoney ? true : false,
        currentPage,
      ),
      menuItem(
        context,
        5,
        // 'Buy a Gift Card',
        localization.buyAGiftCard,
        Icons.card_giftcard,
        currentPage == DrawerSection.buyAGiftCard ? true : false,
        currentPage,
      ),
      menuItem(
        context,
        6,
        // 'Creat a Virtual Card',
        localization.createAVirtualCard,
        Icons.card_membership_sharp,
        currentPage == DrawerSection.createAVirtualCard ? true : false,
        currentPage,
      ),
      // menuItem(
      //   context,
      //   7,
      //   // 'Transactions',
      //   localization.transactions,
      //   Icons.transfer_within_a_station_sharp,
      //   currentPage == DrawerSection.transactions ? true : false,
      //   currentPage,
      // ),
      menuItem(
        context,
        8,
        // 'Settings',
        localization.settings,
        Icons.settings,
        currentPage == DrawerSection.settings ? true : false,
        currentPage,
      ),
      menuItem(
        context,
        9,
        // 'Support centre',
        localization.supportCenter,
        Icons.support,
        currentPage == DrawerSection.supportCentre ? true : false,
        currentPage,
      ),
      menuItem(
        context,
        10,
        // 'Sign out',
        localization.signOut,
        Icons.logout_sharp,
        currentPage == DrawerSection.signOut ? true : false,
        currentPage,
      ),
    ],
  );
}

Widget menuItem(context, int id, String title, IconData icon, bool selected,
    var currentPage) {
  return Material(
    child: InkWell(
      onTap: () {
        if (id == 1) {
          currentPage = DrawerSection.home;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
              (route) => false);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => HomePage(),
          //   ),
          // );
        } else if (id == 2) {
          currentPage = DrawerSection.profile;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
              (route) => false);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ProfilePage(),
          //   ),
          // );
        } else if (id == 3) {
          currentPage = DrawerSection.addMoney;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => AddMoneyPage(),
              ),
              (route) => false);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => AddMoneyPage(),
          //   ),
          // );
        } else if (id == 4) {
          currentPage = DrawerSection.sendMoney;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => SendMoneyPageOne(),
              ),
              (route) => false);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SendMoneyPageOne(),
          //   ),
          // );
        } else if (id == 5) {
          currentPage = DrawerSection.buyAGiftCard;
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => BuyGiftCard(),
          //     ),
          //     (route) => false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuyGiftCard(),
            ),
          );
        } else if (id == 6) {
          currentPage = DrawerSection.createAVirtualCard;
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => VirtualCardPage(),
          //     ),
          //     (route) => false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VirtualCardPage(),
            ),
          );
        }
        // else if (id == 7) {
        //   currentPage = DrawerSection.transactions;
        // }
        else if (id == 8) {
          currentPage = DrawerSection.settings;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => SettingPageOne(),
              ),
              (route) => false);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SettingPageOne(),
          //   ),
          // );
        } else if (id == 9) {
          currentPage = DrawerSection.supportCentre;
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => SupportCentrePageOne(),
          //     ),
          //     (route) => false);

          //* uncomment this
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SupportCentrePageOne(),
            ),
          );
        } else if (id == 10) {
          currentPage = DrawerSection.signOut;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => VirtualCardPageThird(),
              ),
              (route) => false);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => VirtualCardPageThird(),
          //   ),
          // );
        }
      },
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

enum DrawerSection {
  home,
  profile,
  addMoney,
  sendMoney,
  buyAGiftCard,
  createAVirtualCard,
  // transactions,
  settings,
  supportCentre,
  signOut,
}
