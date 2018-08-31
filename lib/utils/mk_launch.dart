import 'dart:async' show Future;

import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launch(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

String _encodeString(String input) => Uri.encodeQueryComponent(input);

void open(String link) => _launch(link);

void call(String phone) => _launch('tel:$phone');

void sms(String phone) => _launch('sms:$phone');

void email({
  @required String email,
  @required String subject,
  String body = "",
}) =>
    _launch(
      'mailto:$email?subject=${_encodeString(subject)}&body=${_encodeString(body)}',
    );
