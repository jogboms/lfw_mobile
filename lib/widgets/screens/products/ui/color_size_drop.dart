import 'package:flutter/material.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_theme.dart';

class ColorSizeDrop extends StatelessWidget {
  const ColorSizeDrop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formStyle = MkTheme.of(context).textfield;

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: new DropdownButton<String>(
                hint: Text(
                  "Color",
                  style: _formStyle.copyWith(
                    color: kHintColor,
                  ),
                ),
                elevation: 1,
                items: <String>['Red', 'Yellow', 'Blue'].map(
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
            Container(
              width: 1.0,
              height: 32.0,
              color: kBorderSideColor,
              margin: EdgeInsets.symmetric(horizontal: 32.0),
            ),
            Expanded(
              child: new DropdownButton<String>(
                hint: Text(
                  "Size",
                  style: _formStyle.copyWith(
                    color: kHintColor,
                  ),
                ),
                elevation: 1,
                items: <String>['XL', 'XXL', 'XXXL'].map(
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
          ],
        ),
      ),
    );
  }
}
