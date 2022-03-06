// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:feras_pay_app/presentation/pages/send_money_page_second.dart';
import 'package:feras_pay_app/presentation/widgets/app_bar_widget.dart';
import 'package:feras_pay_app/presentation/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class SendMoneyPageOne extends StatefulWidget {
  const SendMoneyPageOne({Key? key}) : super(key: key);

  @override
  State<SendMoneyPageOne> createState() => _SendMoneyPageOneState();
}

class _SendMoneyPageOneState extends State<SendMoneyPageOne> {
  List<String> locations = [
    'USD',
    'POUND',
    'LYD',
    'E£',
    '£S',
    'DT',
    'SDG',
    'CFA',
    'PKR',
    'GH₵',
    'CFA',
    '₦',
  ];
  String? _selectedLocation;
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: appBarWidget(context),
      drawer: drawerWidget(context),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                    // 'Send Money',
                    localization.sendMoney,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 50),
                ],
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  // "Select currency and write amount",
                  localization.selectCurrencyAndWriteAmount,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: kSecondTextColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton(
                        elevation: 0,
                        value: _selectedLocation,
                        hint: Text(
                          'USD',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.black,
                        ),
                        items: locations.map((location) {
                          return DropdownMenuItem(
                            child: Text(
                              location,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: location,
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLocation = newValue as String?;
                          });
                        },
                      ),
                      Text(
                        '\u0024100.00',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  // "Input recipient email or user ID",
                  localization.inputRecipientEmail,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: kSecondTextColor),
                  ),
                  child: TextField(
                    controller: TextEditingController(text: "XXXXXXXX"),
                    decoration: InputDecoration(
                      // label: Text("XXXXXXXX"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendMoneyPageSecond(),
                      ),
                      (route) => false);
                },
                child: Center(
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
                      // "Send Money",
                      localization.sendMoney,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
