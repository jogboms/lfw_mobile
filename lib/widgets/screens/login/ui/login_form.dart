import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glam/constants/mk_icons.dart';
import 'package:glam/constants/mk_routes.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/widgets/partials/mk_clear_button.dart';
import 'package:glam/widgets/partials/mk_outline_button.dart';
import 'package:glam/widgets/partials/mk_primary_button.dart';
import 'package:glam/widgets/screens/events/events_page.dart';
import 'package:glam/widgets/screens/forgot/forgot_page.dart';

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
                  prefixIcon: Icon(MkIcons.User, size: 16.0),
                ),
                scrollPadding: EdgeInsets.only(bottom: 40.0),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(MkIcons.Lock, size: 16.0),
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
            MkNavigate(
              context,
              EventsPage(),
              name: MkRoutes.events,
            );
          },
        ),
        SizedBox(height: 16.0),
        new MkOutlineButton(
          child: Text("Login with Facebook"),
          onPressed: () {},
        ),
        SizedBox(height: 16.0),
        new MkClearButton(
          child: Text("Forgot Password?"),
          onPressed: () {
            MkNavigate(context, ForgotPage());
          },
        ),
        SizedBox(height: 2.0),
        MkClearButton(
          child: Text("Sign In as Guest"),
          onPressed: () {
            MkNavigate(context, EventsPage());
          },
        ),
      ],
    );
  }
}
