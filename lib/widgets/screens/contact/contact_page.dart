import 'package:flutter/material.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_back_button.dart';
import 'package:glam/widgets/partials/mk_primary_button.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => new _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextStyle _formStyle;

  @override
  Widget build(BuildContext context) {
    _formStyle = MkTheme.of(context).subhead3;

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: kAccentColor,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: MkBackButton(),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Contact",
                  style: MkTheme.of(context).display3,
                ),
                SizedBox(height: 32.0),
                Text(
                  "GLAM seeks to give fashion buyers and aficionados a simple platform to shop from events/runways, and indulge in all things fashion.\n\nHave any enquiries or suggestions?\nDrop us a message below.",
                  style: MkTheme.of(context).subhead3.copyWith(
                        height: 1.5,
                      ),
                ),
                SizedBox(height: 48.0),
                _buildTextFormField(
                  hintText: "Subject",
                ),
                SizedBox(height: 24.0),
                _buildTextFormField(
                  hintText: "Message",
                  maxLines: 4,
                ),
                SizedBox(height: 48.0),
                MkPrimaryButton(
                  child: Text("Send"),
                  onPressed: () {},
                ),
                SizedBox(height: 48.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField({
    String hintText,
    int maxLines,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: _formStyle.copyWith(
          color: kHintColor,
        ),
        contentPadding: EdgeInsets.only(bottom: 24.0),
      ),
      style: _formStyle,
      maxLines: maxLines,
    );
  }
}
