import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_icons.dart';
import 'package:lfw_mobile/utils/mk_navigate.dart';
import 'package:lfw_mobile/widgets/partials/mk_clear_button.dart';
import 'package:lfw_mobile/widgets/partials/mk_outline_button.dart';
import 'package:lfw_mobile/widgets/partials/mk_primary_button.dart';
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
            ],
          ),
        ),
        SizedBox(height: 32.0),
        new MkPrimaryButton(
          child: Text("Sign In"),
          onPressed: () {
            MkNavigate(context, CollectionsPage());
          },
        ),
        SizedBox(height: 16.0),
        new MkOutlineButton(
          child: Text("Login with Facebook"),
          onPressed: () {},
        ),
        SizedBox(height: 8.0),
        Align(
          alignment: Alignment(-1.2, 0.0),
          child: new MkClearButton(
            child: Text("Forgot Password?"),
            onPressed: () {
              MkNavigate(context, ForgotPage());
            },
          ),
        ),
        SizedBox(height: 8.0),
        Align(
          // alignment: Alignment(-1.25, 0.0),
          alignment: Alignment.bottomCenter,
          child: MkClearButton(
            child: Text("Sign In as Guest"),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
