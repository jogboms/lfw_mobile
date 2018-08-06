import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_icons.dart';
import 'package:lfw_mobile/constants/mk_style.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';
import 'package:lfw_mobile/widgets/partials/mk_clear_button.dart';
import 'package:lfw_mobile/widgets/partials/mk_primary_button.dart';

class ForgotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: kAccentColor,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 64.0 * 1.5),
              Icon(
                MkIcons.Lock_Rotation,
                size: 70.0,
              ),
              SizedBox(height: 64.0),
              Text(
                "Forgot your password?",
                textAlign: TextAlign.center,
                style: mkFontMedium(20.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Enter your email below to receive password reset instructions.",
                textAlign: TextAlign.center,
                style: mkFontRegular(16.0),
              ),
              SizedBox(height: 24.0),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(MkIcons.Mail),
                ),
                scrollPadding: EdgeInsets.only(bottom: 40.0),
              ),
              SizedBox(height: 32.0),
              MkPrimaryButton(
                child: Text("Send Password"),
                onPressed: () {},
              ),
              SizedBox(height: 16.0),
              Align(
                // alignment: Alignment(-1.25, 0.0),
                alignment: Alignment.bottomCenter,
                child: MkClearButton(
                  child: Text("Sign Up"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
