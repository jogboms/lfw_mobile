import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/utils/mk_navigate.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';
import 'package:lfw_mobile/widgets/screens/collections/collections_page.dart';
import 'package:lfw_mobile/widgets/screens/forgot/forgot_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person_outline),
                ),
                scrollPadding: EdgeInsets.only(bottom: 40.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
                scrollPadding: EdgeInsets.only(bottom: 40.0),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.0),
        FlatButton(
          color: MkColors.black,
          child: Text("Sign In", style: mkFontColor(MkColors.white)),
          onPressed: () {
            MkNavigate(context, CollectionsPage());
          },
        ),
        SizedBox(height: 16.0),
        OutlineButton(
          child: Text("Login with Facebook"),
          onPressed: () {},
          borderSide: BorderSide(color: MkColors.black, width: 2.5),
        ),
        SizedBox(height: 8.0),
        Align(
          alignment: Alignment(-1.2, 0.0),
          child: CupertinoButton(
            child: Text(
              "Forgot Password?",
              style: mkFontRegular(16.0, MkColors.black),
            ),
            onPressed: () {
              MkNavigate(context, ForgotPage());
            },
          ),
        ),
        SizedBox(height: 8.0),
        Align(
          // alignment: Alignment(-1.25, 0.0),
          alignment: Alignment.bottomCenter,
          child: CupertinoButton(
            child: Text(
              "Sign In as Guest",
              style: mkFontRegular(16.0, MkColors.black),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
