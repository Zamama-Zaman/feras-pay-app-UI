// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:feras_pay_app/presentation/pages/buy_gift_card_page_third.dart';
import 'package:feras_pay_app/presentation/widgets/app_bar_widget.dart';
import 'package:feras_pay_app/presentation/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class BuyGiftCardSecond extends StatefulWidget {
  final int imageIndex;
  const BuyGiftCardSecond({Key? key, required this.imageIndex})
      : super(key: key);

  @override
  State<BuyGiftCardSecond> createState() => _BuyGiftCardSecondState();
}

class _BuyGiftCardSecondState extends State<BuyGiftCardSecond> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    print(
        "${widget.imageIndex.toString()} I am called at build in buy_gift_card_page_second.dart");
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: appBarWidget(context),
      drawer: drawerWidget(context),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
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
                    // 'Buy Gift Card',
                    localization.buyGiftCard,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 50),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 300,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/detail_card_${widget.imageIndex}.jpg'),
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width / 1.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: price.length,
                itemBuilder: (context, _index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      index = _index;
                    });
                  },
                  child: _index == index
                      ? smallMoneyCard(
                          price[_index],
                          kSecondTextColor,
                          kBackGroundColor,
                        )
                      : smallMoneyCard(
                          price[_index],
                          Colors.transparent,
                          kTextColor,
                        ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuyGiftCardPageThrid(),
                  ),
                );
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => BuyGiftCardPageThrid(),
                //     ),
                //     (route) => false);
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: MediaQuery.of(context).size.width / 2.5,
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
                  // "Purchase",
                  localization.purchase,
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

  Container smallMoneyCard(String price, Color _boxColor, Color _textColor) {
    return Container(
      width: 60,
      height: 40,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: _boxColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: kSecondTextColor),
      ),
      child: Center(
        child: Text(
          "\u0024 $price",
          style: TextStyle(
            color: _textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

List<String> price = [
  "10",
  "25",
  "50",
  "100",
];
