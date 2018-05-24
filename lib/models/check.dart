import 'package:flutter/material.dart';

class Check {
  final IconData headerIcon;
  final Color headerIconColor;
  final Color headerIconTextColor;
  final String titleText;
  final IconData cornerIcon;
  final Color cornerIconColor;
  final String amount;
  final String date;
  final String status;

  const Check({this.headerIcon, this.headerIconTextColor, this.headerIconColor, this.titleText, this.cornerIcon, this.cornerIconColor,
        this.amount, this.date, this.status});
}
