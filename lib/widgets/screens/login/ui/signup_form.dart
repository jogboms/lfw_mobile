import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_icons.dart';
import 'package:lfw_mobile/widgets/partials/mk_clear_button.dart';
import 'package:lfw_mobile/widgets/partials/mk_primary_button.dart';

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
                  prefixIcon: Icon(MkIcons.User),
                ),
                scrollPadding: EdgeInsets.only(bottom: 40.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(MkIcons.Lock),
                ),
                scrollPadding: EdgeInsets.only(bottom: 40.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(MkIcons.Mail),
                ),
                scrollPadding: EdgeInsets.only(bottom: 40.0),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.0),
        MkPrimaryButton(
          child: Text("Sign Up"),
          onPressed: () {},
        ),
        SizedBox(height: 16.0),
        Align(
          // alignment: Alignment(-1.25, 0.0),
          alignment: Alignment.bottomCenter,
          child: MkClearButton(
            child: Text("Sign In"),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
