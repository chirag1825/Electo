import 'package:electo/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'otp_view_controller.dart';

class OtpView extends StatelessWidget {
  final String? email;
  OtpView({Key? key, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      init: OtpController(),
      builder: (s) => Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(20),
              horizontal: ScreenUtil().setWidth(20)),
          child: Card(
            elevation: 5,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpaceMedium,
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(25)),
                  child: Text(
                    'Enter Your OTP ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                verticalSpaceSmall,
                SizedBox(
                  width: ScreenUtil().setWidth(300),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: s.otpController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your OTP'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(20),
                      horizontal: ScreenUtil().setWidth(25)),
                  child: MaterialButton(
                    color: Colors.blue[50],
                    onPressed: () => s.submit(email!),
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
