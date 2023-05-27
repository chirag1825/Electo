import 'package:electo/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future alertDialog(dynamic message, {Color? color}) async {
  return await Get.dialog(Alert(message: message, color: color));
}

class Alert extends StatelessWidget {
  final dynamic message;
  final Color? color;

  const Alert({Key? key, this.message, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: color ?? Colors.red[200],
        elevation: 5,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpaceSmall,
            Text(
              'Alert',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message ?? '',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => Get.back(),
                color: Colors.red[50],
                child: Text(
                  'OK',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
