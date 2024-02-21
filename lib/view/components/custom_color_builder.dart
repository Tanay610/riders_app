import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

// class CustomColorBuilder implements ColorBuilder {
//   final Color focusedColor;
//   final Color unfocusedColor;
//   final List<FocusNode> focusNodes;

//   CustomColorBuilder(this.focusedColor, this.unfocusedColor, this.focusNodes);

//   @override
//   Color call(dynamic context, dynamic index) {
//     for (var i = 0; i < focusNodes.length; i++) {
//       if (focusNodes[i].hasFocus) {
//         return i == index ? focusedColor : unfocusedColor;
//       }
//     }
//     return unfocusedColor;
//   }
  
//   @override
//   Color indexProperty(int index) {
//     // TODO: implement indexProperty
//     throw UnimplementedError();
//   }
  
//   @override
//   void notifyChange(String enteredPin) {
//     // TODO: implement notifyChange
//   }
// }


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