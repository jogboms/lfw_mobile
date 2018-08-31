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
  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: MkBorderSide()),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: new DropdownButton<String>(
                      hint: Text(
                        "Gender",
                        style: MkTheme.of(context).textfield,
                      ),
                      elevation: 1,
                      items: <String>['Male', 'Female', 'Others'].map(
                        (String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(
                              value,
                              style: MkTheme.of(context).body1,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                _buildTextFormField(
                  hintText: "Email",
                ),
                SizedBox(height: 20.0),
                _buildTextFormField(
                  hintText: "Phone Number",
                ),
                SizedBox(height: 20.0),
                _buildTextFormField(
                  hintText: "Address",
                ),
                SizedBox(height: 20.0),
                _buildTextFormField(
                  hintText: "Website",
                ),
                SizedBox(height: 20.0),
                _buildTextFormField(
                  hintText: "Bio",
                  maxLines: 4,
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
        contentPadding: EdgeInsets.only(bottom: 16.0),
      ),
      maxLines: maxLines,
      scrollPadding: EdgeInsets.only(bottom: 40.0),
    );
  }
}
