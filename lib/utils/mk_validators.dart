import 'package:flutter/widgets.dart';

String Function(String) mKValidateAlpha() {
  return (String value) {
    if (value.isEmpty) {
      return 'Name is required.';
    }
    final RegExp nameExp = new RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  };
}

String Function(String) mKValidateEmail() {
  return (String value) {
    if (value.isEmpty) {
      return 'Email is required.';
    }
    if (!value.contains('@')) {
      return 'Not a valid email.';
    }
    return null;
  };
}

String Function(String) mKValidateAmount() {
  return (String value) {
    if (value.isEmpty) {
      return 'Amount is required.';
    }
    if (double.tryParse(value) == null) {
      return 'Invalid Amount.';
    }
    if (!new RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
      return 'Not a valid amount.';
    }
    if (double.tryParse(value).ceil() <= 0) {
      return 'Zero Amount is not allowed.';
    }
    return null;
  };
}

String Function(String) mKValidatePassword(
    FormFieldState<String> passwordField) {
  return (String value) {
    if (passwordField == null) {
      return 'Please enter a password.';
    }
    if (passwordField.value == null || passwordField.value.isEmpty) {
      return 'Please enter a password.';
    }
    if (passwordField?.value != value) {
      return 'The passwords don\'t match';
    }
    return null;
  };
}
