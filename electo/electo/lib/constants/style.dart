import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget horizontalSpaceTiny = SizedBox(width: ScreenUtil().setWidth(5.0));
Widget horizontalSpaceSmall = SizedBox(width: ScreenUtil().setWidth(10.0));
Widget horizontalSpaceMedium = SizedBox(width: ScreenUtil().setHeight(25.0));
Widget verticalSpaceTiny = SizedBox(height: ScreenUtil().setHeight(5.0));
Widget verticalSpaceSmall = SizedBox(
  height: 10,
);
Widget verticalSpaceMedium = SizedBox(height: ScreenUtil().setHeight(25.0));
Widget verticalSpaceLarge = SizedBox(height: ScreenUtil().setHeight(50.0));
Widget verticalSpaceMassive = SizedBox(height: ScreenUtil().setHeight(120.0));

Widget spacedDivider = Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: ScreenUtil().setHeight(5.0)),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);
Widget horizontalSpace(double width) => SizedBox(width: width);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
theme(BuildContext context) => Theme.of(context);

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);
