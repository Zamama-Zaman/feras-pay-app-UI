// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:bubble/bubble.dart';
import 'package:feras_pay_app/presentation/widgets/app_bar_widget.dart';
import 'package:feras_pay_app/presentation/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:feras_pay_app/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';

class SupporCentrePageSecond extends StatefulWidget {
  const SupporCentrePageSecond({Key? key}) : super(key: key);

  @override
  State<SupporCentrePageSecond> createState() => _SupporCentrePageSecondState();
}

class _SupporCentrePageSecondState extends State<SupporCentrePageSecond> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: appBarWidget(context),
      drawer: drawerWidget(context),
      body: Column(
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
          ),
          SizedBox(height: 20),
          Text(
            // 'Agent John has joined the chat',
            localization.agentJohnHasJoinedTheChat,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: false,
              itemCount: complainMessage.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? MessageLayout(
                        type: 'type',
                        senderId: '',
                        text: complainMessage[0],
                        time: "11:57 AM",
                        color: const Color(0xFF15B4AF),
                        align: TextAlign.left,
                        nip: BubbleNip.rightTop,
                        crossAxisAlignmentCustom: CrossAxisAlignment.end,
                        boxAlignment: CrossAxisAlignment.end,
                        boxMainAxisAlignment: MainAxisAlignment.end,
                        uid: '',
                      )
                    : MessageLayout(
                        uid: "",
                        type: "",
                        senderName: "Anthony",
                        text: complainMessage[1],
                        time: "11:58 AM",
                        color: Colors.yellow,
                        align: TextAlign.left,
                        crossAxisAlignmentCustom: CrossAxisAlignment.start,
                        nip: BubbleNip.leftTop,
                        boxAlignment: CrossAxisAlignment.start,
                        boxMainAxisAlignment: MainAxisAlignment.start,
                      );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            alignment: Alignment.center,
            height: 50,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              color: Colors.purpleAccent.shade200,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.tag_faces_sharp,
                  color: Colors.white,
                  size: 30,
                ),
                Container(
                  width: 250,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      // hintText: "Write here",
                      // hintText: localization.writeHere,
                      labelText: localization.writeHere,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class MessageLayout extends StatelessWidget {
  final String uid;
  final String type;
  final text;
  final time;
  final color;
  final align;
  final crossAxisAlignmentCustom;
  final boxAlignment;
  final nip;
  final senderName;
  final senderId;
  final boxMainAxisAlignment;

  const MessageLayout({
    Key? key,
    required this.uid,
    required this.type,
    this.text,
    this.time,
    this.color,
    this.align,
    this.crossAxisAlignmentCustom,
    this.boxAlignment,
    this.nip,
    this.senderName,
    this.senderId,
    this.boxMainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: boxAlignment,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: boxMainAxisAlignment,
          children: [
            // color == Colors.yellow
            //     ? Container(
            //         height: 35,
            //         width: 35,
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.black, width: 2),
            //           borderRadius: const BorderRadius.all(
            //             Radius.circular(55),
            //           ),
            //         ),
            //         // child: Image.asset("assets/images/profile_default.png"),
            //       )
            //     : const Text(
            //         "",
            //         style: TextStyle(fontSize: 0),
            //       ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: crossAxisAlignmentCustom,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: color == const Color(0xFF15B4AF)
                        ? Text(
                            "Jhon",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          )
                        : Text(
                            senderName,
                            textAlign: align,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                  ),
                  SizedBox(height: 10),
                  Bubble(
                    padding: BubbleEdges.fromLTRB(20, 12, 10, 12),
                    color: kSecondTextColor.withOpacity(.3),
                    nip: nip,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Text(
                        text == "" ? "" : text,
                        textAlign: align,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      time,
                      textAlign: align,
                      style: TextStyle(
                        color: kTextColor.withOpacity(.6),
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
