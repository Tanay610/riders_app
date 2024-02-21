import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class CustomColorBuilder implements ColorBuilder {
  final Color enteredColor;
  final Color notEnteredColor;
  var maxIndex = 0;
  CustomColorBuilder(this.enteredColor, this.notEnteredColor);
  @override
  Color indexProperty(int index) {
    return index > maxIndex ? notEnteredColor : enteredColor;
  }
  @override
  void notifyChange(String enteredPin) {
    maxIndex = enteredPin.length;
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CustomColorBuilder &&
              runtimeType == other.runtimeType &&
              enteredColor == other.enteredColor &&
              notEnteredColor == other.notEnteredColor &&
              maxIndex == other.maxIndex;
  @override
  int get hashCode =>
      enteredColor.hashCode ^ notEnteredColor.hashCode ^ maxIndex.hashCode;
}