// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

AppBar appBarWidget(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    title: Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Image(
          image: AssetImage('assets/app_bar.png'),
        ),
      ),
    ),
    elevation: 0.0,
    actions: [
      SizedBox(width: 10.0),
      Icon(
        Icons.notifications,
        color: Colors.black,
      ),
      SizedBox(width: 10.0),
    ],
  );
}
