import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/constants/mk_images.dart';
import 'package:lfw_mobile/utils/mk_navigate.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';
import 'package:lfw_mobile/widgets/screens/forgot/forgot_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 64.0 * 1.5),
              Center(
                child: ImageIcon(
                  MkImages.glam,
                  color: MkColors.black,
                  size: 120.0,
                ),
              ),
              SizedBox(height: 32.0),
              _buildSwitcher(
                index: activeIndex,
                onChange: (index) {
                  if (activeIndex == index) {
                    return;
                  }
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: LayoutBuilder(builder: (_, __) {
                  return ConstrainedBox(
                    constraints: __,
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 150),
                      firstChild: _buildLoginForm(),
                      secondChild: _buildSignupForm(),
                      crossFadeState: activeIndex == 1
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
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
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.0),
        FlatButton(
          color: MkColors.black,
          child: Text("Sign In", style: mkFontColor(MkColors.white)),
          onPressed: () {},
        ),
        SizedBox(height: 8.0),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: MkColors.black),
          ),
          child: Text("Login with Facebook"),
          onPressed: () {},
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
        // SizedBox(height: 8.0),
        // Expanded(child: SizedBox()),
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

  Widget _buildSignupForm() {
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
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
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
        // Expanded(child: SizedBox()),
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

  Widget _buildSwitcherButton({
    Widget child,
    bool isActive = true,
    VoidCallback onPressed,
  }) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: isActive
            ? BoxDecoration(
                border: Border(bottom: BorderSide(width: 2.0)),
              )
            : null,
        child: new DefaultTextStyle(
          style: mkFont(
            18.0,
            isActive ? MkColors.black : MkColors.light_grey,
          ).copyWith(
            fontWeight: FontWeight.w500,
          ),
          child: child,
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildSwitcher({void Function(int) onChange, int index}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildSwitcherButton(
            child: Text("Sign In"),
            isActive: index == 1,
            onPressed: () {
              onChange(1);
            },
          ),
          _buildSwitcherButton(
            child: Text("Sign Up"),
            isActive: index == 2,
            onPressed: () {
              onChange(2);
            },
          ),
        ],
      ),
    );
  }
}
