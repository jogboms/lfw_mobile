import 'package:flutter/material.dart';
import 'package:lfw_mobile/widgets/partials/mk_loading_snackbar.dart';

abstract class MkSnackBarProvider {
  GlobalKey<ScaffoldState> get scaffoldKey;

  void showInSnackBar(String value) {
    scaffoldKey.currentState?.showSnackBar(
      new SnackBar(content: new Text(value)),
    );
  }

  void closeLoadingSnackBar() {
    scaffoldKey.currentState?.hideCurrentSnackBar();
  }

  void showLoadingSnackBar([Widget content]) {
    scaffoldKey.currentState?.showSnackBar(
      new MkLoadingSnackBar(
        content: content,
      ),
    );
  }
}
