import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_style.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';

class MkLoadingSnackBar extends SnackBar {
  MkLoadingSnackBar({Key key, Widget content})
      : super(
          key: key,
          backgroundColor: content == null ? Colors.white : kPrimaryColor,
          content: Row(
            mainAxisAlignment: content == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              SizedBox.fromSize(
                size: Size(48.0, 24.0),
                // child: SpinKitThreeBounce(
                //   color: content == null ? kPrimaryColor : Colors.white,
                //   size: 24.0,
                // ),
              ),
              SizedBox(width: content == null ? 0.0 : 16.0),
              content == null
                  ? SizedBox()
                  : new DefaultTextStyle(
                      style: mkFont(14.0, Colors.white),
                      child: content,
                    ),
            ],
          ),
          duration: Duration(days: 1),
        );
}
