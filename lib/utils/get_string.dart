
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart' hide Trans;

String getString(String tag, {String? plural, int length = 0, Map<String, String>? params}) {
  // if (plural != null) {
  //   if (params != null) {
  //     return tag.trPluralParams(plural, length, params);
  //   }
  //   return tag.trPlural(plural, length);
  // }
  // if (params != null) {
  //   return tag.trParams(params);
  // }

  Map<String, dynamic> translator = {};

  String translation = translator[tag] ?? tag;

  return translation.tr();
}
