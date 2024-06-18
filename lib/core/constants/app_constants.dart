import 'package:flutter/material.dart';

enum AppEnv { DEV, PROD, STG }

class Constants {
  static String appName = 'Rps Remit';

  static AppEnv appEnv = AppEnv.DEV;
}

/// TO BE FETCHED FROM BACKEND
const category = [
  "Fashion & Beauty",
  "Information Tech",
  "Workout",
  "Dance",
  "Dating",
  "Business",
  "Foodies",
  "Politics",
  "Social Service",
  "Entertainment",
  "Sports",
  "New gift ideas"
];
const kPrimaryColor = Color(0xff1C7927);
const kTextColor = Color(0xff16611F);
const kBackgroundColor = Color(0xfff9f8fd);

const double kDefaultPadding = 20.0;
