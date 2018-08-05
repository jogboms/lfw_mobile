import 'package:flutter/material.dart';
import 'package:lfw_mobile/widgets/screens/login/login_page.dart';

class StartPage extends StatefulWidget {
  @override
  StartPageState createState() => new StartPageState();
}

class StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
