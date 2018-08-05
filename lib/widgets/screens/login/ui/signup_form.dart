import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
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
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
                scrollPadding: EdgeInsets.only(bottom: 40.0),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.0),
        FlatButton(
          color: MkColors.black,
          child: Text("Sign Up", style: mkFontColor(MkColors.white)),
          onPressed: () {},
        ),
        SizedBox(height: 16.0),
        Align(
          // alignment: Alignment(-1.25, 0.0),
          alignment: Alignment.bottomCenter,
          child: CupertinoButton(
            child: Text(
              "Sign In",
              style: mkFontRegular(16.0, MkColors.black),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
