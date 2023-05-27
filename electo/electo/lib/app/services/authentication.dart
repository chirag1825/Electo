import 'package:electo/app/api/api.dart';
import 'package:electo/app/model/user.dart';
import 'package:electo/app/services/storage_secured.dart';
import 'package:electo/constants/const.dart';
import 'package:electo/dialog/alert_dialog.dart';
import 'package:electo/ui/home/home_view.dart';
import 'package:electo/ui/start/otp/otp_view.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'failure.dart';

class AuthenticationService {
  // registerUser(String email, String password) async {
  //   try {
  //     Map<String, String> body = {"email": email, "password": password};
  //     var res = await RestApi.sendData(query: auth + register, body: body);
  //     print(res);
  //   } catch (e) {
  //     await alertDialog(e);
  //   }
  // }

  loginUser(String email) async {
    try {
      Map<String, String> body = {"email": email};
      var res = await RestApi.sendData(query: auth + sendOTP, body: body);
      print(res);
      if (res is Map) {
        // print(res);
        // await StorageSecured.write(accessToken, res[accessToken]);
        // await StorageSecured.write(refreshToken, res[refreshToken]);
        await Get.off(() => OtpView(
              email: email,
            ));
      }
      // print(res.statusCode.toString());
    } catch (e) {
      if (e is Failure) await alertDialog(e.message);
    }
  }

  checkOtp(String email, String otp) async {
    try {
      Map<String, String> body = {"email": email, "otp": otp};
      var res = await RestApi.sendData(query: auth + verifyOTP, body: body);
      print(res);
      if (res is Map) {
        print(res);
        await StorageSecured.write(accessToken, res[accessToken]);
        await StorageSecured.write(refreshToken, res[refreshToken]);
        await Get.off(() => HomeView());
      }
      // print(res.statusCode.toString());
    } catch (e) {
      if (e is Failure) await alertDialog(e.message);
    }
  }

  getAccessToken() async {
    try {
      var refreshtoken = await StorageSecured.read(refreshToken);
      Map<String, String> body = {"refreshToken": refreshtoken};
      var res =
          await RestApi.sendData(query: auth + refreshTokenRoute, body: body);
      print(res);
      if (res is Map) {
        await StorageSecured.write(accessToken, res[accessToken]);
        await StorageSecured.write(refreshToken, res[refreshToken]);
      }
      print(res);
    } catch (e) {
      await alertDialog(e);
    }
  }

  static get userIdInApp async {
    var user = await StorageSecured.read(userId);
    return user;
  }

  //var UserID async  => await ;
  userExistsInApp() async {
    try {
      // Verify a token
      var userToken = await StorageSecured.read(accessToken);
      print(userToken);
      if (userToken == null) {
        return false;
      } else {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(userToken);
        await StorageSecured.write(userId, decodedToken['aud']);
        if (DateTime.now().millisecondsSinceEpoch >
            decodedToken['exp'] * 1000) {
          await getAccessToken();
        }
        return true;
      }
    } catch (e) {
      print(e);
    }
  }

  getProfile(String id) async {
    Map<String, dynamic> res =
        await RestApi.sendData(query: profile, body: {"id": id});
    if (res is Map) {
      User user = User.fromJson(res);
      print(user);
      return user;
    }
  }
}
