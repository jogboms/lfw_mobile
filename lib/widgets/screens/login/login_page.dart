import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/screens/login/ui/login_form.dart';
import 'package:glam/widgets/screens/login/ui/signup_form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 32.0 * 1.5),
                Center(
                  child: ImageIcon(
                    MkImages.glam,
                    color: MkColors.black,
                    size: 100.0,
                  ),
                ),
                SizedBox(height: 24.0),
                _buildSwitcher(
                  index: activeIndex,
                  onChange: onSwitchIndex,
                ),
                SizedBox(height: 24.0),
                LayoutBuilder(builder: (_, __) {
                  return AnimatedCrossFade(
                    duration: const Duration(milliseconds: 150),
                    firstChild: new LoginForm(),
                    secondChild: new SignupForm(onSwitchIndex: onSwitchIndex),
                    crossFadeState: activeIndex == 1
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
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
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: isActive
            ? BoxDecoration(
                border: Border(bottom: BorderSide(width: 2.0)),
              )
            : null,
        child: new DefaultTextStyle(
          style: MkTheme.of(context).subhead1.copyWith(
                color: isActive ? MkColors.black : MkColors.light_grey,
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

  void onSwitchIndex(int index) {
    if (activeIndex == index) {
      return;
    }
    setState(() {
      activeIndex = index;
    });
  }
}
