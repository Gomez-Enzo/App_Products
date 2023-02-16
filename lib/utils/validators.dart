import 'package:app_products/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// Provides mail validation
String? validateEmail(String? value, BuildContext context) {
  const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regExp = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return context.l10n.youHaveToCompleteThisField;
  }

  if (!regExp.hasMatch(value)) {
    return context.l10n.invalidMail;
  }

  return null;
}

/// Provides password lenght validation
String? validatePassword(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return context.l10n.youHaveToCompleteThisField;
  } else if (value.length <= 8) {
    return context.l10n.invalidPassword;
  }
  return null;
}
