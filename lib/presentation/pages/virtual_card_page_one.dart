// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:feras_pay_app/presentation/pages/virtual_card_page_second.dart';
import 'package:feras_pay_app/presentation/widgets/app_bar_widget.dart';
import 'package:feras_pay_app/presentation/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class VirtualCardPage extends StatefulWidget {
  const VirtualCardPage({Key? key}) : super(key: key);

  @override
  State<VirtualCardPage> createState() => _VirtualCardPageState();
}

class _VirtualCardPageState extends State<VirtualCardPage> {
  String radioItem = 'Visa Card';
  int id = 1;
  List<VirtualCardRadio> virutalCard = [
    VirtualCardRadio(name: "Visa Card", index: 1),
    VirtualCardRadio(name: "Master Card", index: 2),
  ];
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
                  // 'Virtual Card',
                  localization.virtualCard,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 50),
              ],
            ),
            SizedBox(height: 20),
            Text(
              // "Create Instant Virtual Card",
              localization.createAVirtualCard,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 300,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage('assets/images/virtual_card_1.jpg'),
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              // "Choose Card Brand",
              localization.chooseCardBrand,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: virutalCard
                  .map(
                    (data) => Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Radio(
                            groupValue: id,
                            value: data.index,
                            onChanged: (val) {
                              setState(() {
                                radioItem = data.name;
                                id = data.index;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              data.name,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VirtualCardPageSecond(),
                  ),
                );
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
                  // "Creat Now",
                  localization.creatNow,
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

class VirtualCardRadio {
  final String name;
  final int index;

  VirtualCardRadio({required this.name, required this.index});
}
