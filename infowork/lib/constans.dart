import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF3362F3);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12,
);

const boxdecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF3362F3), Color(0XFF3967F2), Color(0xFF5079F3)],
  ),
);
