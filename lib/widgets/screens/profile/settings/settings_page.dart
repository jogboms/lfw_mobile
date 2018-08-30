import 'package:flutter/material.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_back_button.dart';
import 'package:glam/widgets/partials/mk_primary_button.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment(-1.175, 0.0),
                  child: Text(
                    "Bio Data",
                    style: MkTheme.of(context).display3,
                  ),
                ),
                SizedBox(height: 48.0),
                _buildTextFormField(
                  hintText: "Fullname",
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.only(bottom: 12.0),
                  decoration: BoxDecoration(
                    border: Border(bottom: MkBorderSide()),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: new DropdownButton<String>(
                      hint: Text(
                        "Gender",
                        style: _formStyle.copyWith(
                          color: kHintColor,
                        ),
                      ),
                      elevation: 1,
                      items: <String>['Male', 'Female', 'Others'].map(
                        (String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(
                              value,
                              style: _formStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                _buildTextFormField(
                  hintText: "Email",
                ),
                SizedBox(height: 24.0),
                _buildTextFormField(
                  hintText: "Phone Number",
                ),
                SizedBox(height: 24.0),
                _buildTextFormField(
                  hintText: "Address",
                ),
                SizedBox(height: 24.0),
                _buildTextFormField(
                  hintText: "Website",
                ),
                SizedBox(height: 24.0),
                _buildTextFormField(
                  hintText: "Bio",
                  maxLines: null,
                ),
                SizedBox(height: 24.0),
                MkPrimaryButton(
                  child: Text("Submit"),
                  onPressed: () {},
                )
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
