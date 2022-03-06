// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:feras_pay_app/presentation/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<String> locations = [
    'USA',
    'UK',
    'Austrila',
    'Germany',
    'LIBYA',
    'Egypt',
    'Syria',
    'Tunisia',
    'Sudan',
    'Niger',
    'Pakistan',
    'Ghana',
    'Senegal',
    'Nigeria',
    'Algeria',
    'Morocco',
    'Palestine',
  ];
  String? _selectedLocation;
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: localization.english == "English" ? 20 : 0,
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/Sign In.png'),
                ),
                SizedBox(
                  height: localization.english == "English" ? 10 : 0,
                ),
                Align(
                  alignment: localization.english == "English"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Text(
                    localization.selectCountry,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: localization.english == "English" ? 10 : 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                  child: DropdownButton(
                    value: _selectedLocation,
                    isExpanded: true,
                    hint: Text('USA'),
                    underline: SizedBox(),
                    borderRadius: BorderRadius.circular(15.0),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue as String?;
                      });
                    },
                    items: locations.map((location) {
                      return DropdownMenuItem(
                        child: Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: localization.english == "English" ? 10 : 8,
                ),
                Align(
                  alignment: localization.english == "English"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Text(
                    localization.fullName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: localization.english == "English" ? 10 : 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Anthony Joshua",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: localization.english == "English"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Text(
                    localization.email,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: localization.english == "English" ? 10 : 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "contactinfo@gmail.com",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: localization.english == "English"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Text(
                    localization.password,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "xxxxxxxx",
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: localization.english == "English"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Text(
                    // "Phone Number",
                    localization.phoneNumber,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: "Write Phone",
                      hintText: localization.writePhone,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade300,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                      ),
                      BoxShadow(
                        color: Colors.pink.shade900,
                        spreadRadius: -4,
                        blurRadius: 12,
                      )
                    ],
                  ),
                  child: Text(
                    // "Sign Up",
                    localization.signUp,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // "Already have an Account? ",
                      localization.alreadyHaveAnAccount,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                            (route) => false);
                      },
                      child: Text(
                        // "Sign In",
                        localization.signIn,
                        style: TextStyle(fontSize: 16, color: Colors.pink),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
