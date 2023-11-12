import 'package:flutter/material.dart';

const kWhite = Colors.white;
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 55.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  color: kWhite,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white12,
  border: OutlineInputBorder(),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  hintText: 'Enter city name',
  prefixIcon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
);
