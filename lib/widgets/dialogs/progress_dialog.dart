import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static void show(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => WillPopScope(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.amber,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
              onWillPop: () async => false,
            ));
  }
}
