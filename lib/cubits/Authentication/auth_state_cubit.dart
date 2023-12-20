import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

part 'auth_state_state.dart';

class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit() : super(AuthStateInitial());

  void loadingstate() {
    emit(AuthLoDInGState());
  }

  void onBRD() {
    emit(AuthOnBoard());
  }

  void dataload() {
    emit(AuthLoginState());
  }

  ///
  ///
  ///login Page
  ///
  void LoginPage(String phoneNumber) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/signIn'));
    request.body = json.encode({"mobile": "${phoneNumber}"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String loding2 = "login";
      GetStorage().write('LOAD', loding2);

      print(await response.stream.bytesToString());
      emit(AuthLoginState());
    } else {
      print(response.reasonPhrase);
      emit(AuthErrorState(response.reasonPhrase.toString()));
    }
  }

  ///
  ///resendOTP
  ///
  ///
  void ResendOTP(String PhoneNumber, String voiceText) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/resend'));
    request.body =
        json.encode({"mobile": "${PhoneNumber}", "type": "${voiceText}"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    } else {
      emit(AuthErrorState(response.reasonPhrase.toString()));
    }
  }

  ///
  ///
  ///VerifyOTP
  ///
  ///

  void verifyOTP(String phoneNumber, String otp) async {
    int OTP = int.parse(otp);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/verify'));
    request.body = json.encode({"mobile": '${phoneNumber}', "otp": OTP});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map responseData = json.decode(await response.stream.bytesToString());

      String RefreshToken = responseData['data']['refreshToken'];
      GetStorage().write('RefreshTokenGet', RefreshToken);

      print(RefreshToken);

      emit(AuthVerifyOtpState());
      print(await response.stream.bytesToString());
    } else {
      emit(AuthErrorState(response.reasonPhrase.toString()));
    }
  }

  ///
  ///AccessRefresh
  ///
  ///

  void AccessIn() async {
    String RefreshTokenGET =
        GetStorage().read('RefreshTokenGet') ?? 'No data available';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySW5mbyI6eyJpZCI6IjY1NzZmNWU3MDc5ODdjZDQ0MGZlZGU3MSJ9LCJpYXQiOjE3MDIyOTUwMTYsImV4cCI6MTcwMjMzODIxNn0.fffWb9aICBPj9kIOSsJsn3KTV9L4DM2ZQCYlbiHKNw0'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/refresh'));
    request.body = json.encode({"refreshToken": "${RefreshTokenGET}"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map responseData = json.decode(await response.stream.bytesToString());

      String newAccesscode = responseData['data']['accessToken'];
      GetStorage().write('NewAccessCode', newAccesscode);
      String newRefreshToken = responseData['data']['refreshToken'];
      GetStorage().write('NewRefreshCode', newRefreshToken);

      emit(AuthAccessState());
      emit(AuthLoginState());
      emit(AuthGETDATA());
      emit(Authserver());
    } else {
      emit(AuthErrorState(response.reasonPhrase.toString()));
    }
  }
  //
  //
  //Logout
  //

  void logout() async {
    String NewRefreshToken =
        GetStorage().read('NewRefreshCode') ?? 'No data available';
    String NewAccessToken =
        GetStorage().read('NewAccessCode') ?? 'No data available';

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${NewAccessToken}'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/logout'));
    request.body = json.encode({"refreshToken": "${NewRefreshToken}"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String logout = "logout";
      GetStorage().write('LOAD', logout);
      emit(AuthLogoutState());
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      emit(AuthErrorState(response.reasonPhrase.toString()));
    }
  }

  ///
  ///Delete Account
  ///
  ///
  void DeleteAccount() async {
    String PhoneNumberDelete =
        GetStorage().read('FetchMobile') ?? 'No data available';
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/delete-customer'));
    request.body = json.encode({"mobile": "${PhoneNumberDelete}"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
         String logout2 = "delete";
      GetStorage().write('LOAD', logout2);
      emit(AuthDeleteAccountState());
      print(await response.stream.bytesToString());
    } else {
      emit(AuthErrorState(response.reasonPhrase.toString()));
    }
  }

  void registerDetails(String firstnamem, String lastname, String email,
      String phoneNumber) async {
    int phone = int.parse(phoneNumber);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/register'));
    request.body = json.encode({
      "mobile": phone,
      "firstName": "${firstnamem}",
      "lastName": "${lastname}",
      "email": "${email}"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String loding2 = "loaded";
      GetStorage().write('LOAD', loding2);

      emit(AuthLoginState());
      emit(AuthGETDATA());
      emit(Authserver());
      emit(AuthRegisterDetails());
      print(await response.stream.bytesToString());
    } else {
      emit(AuthErrorState(response.reasonPhrase.toString()));
    }
  }

  //
  //
  //fetchData
  //
  void GetData() async {
    String NewRefreshToken =
        GetStorage().read('NewRefreshCode') ?? 'No data available';
    String NewAccessToken =
        GetStorage().read('NewAccessCode') ?? 'No data available';
    var headers = {'Authorization': 'Bearer ${NewAccessToken}'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/get-customer'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map responseData = json.decode(await response.stream.bytesToString());

      String firstname = responseData['data']['user'][0]['firstName'];
      String lastname = responseData['data']['user'][0]['lastName'];
      String mobile = responseData['data']['user'][0]['mobile'];
      GetStorage().write('FetchMobile', mobile);
      GetStorage().write('FetchName', firstname);
      GetStorage().write('FetchLast', lastname);

      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  void serverHealth() async {
    var request = http.Request(
        'GET', Uri.parse('https://as-uat.console.chargemod.com/health'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map responseData = json.decode(await response.stream.bytesToString());
      dynamic servertime = responseData['uptime'];
      GetStorage().write('ServerTime', servertime);
      dynamic servermessage = responseData['message'];
      GetStorage().write('Servermessage', servermessage);
      dynamic timestamp = responseData['timestamp'];
      GetStorage().write('Severtimestamp', timestamp);
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  //
  //
  void getLocation() async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySW5mbyI6eyJpZCI6IjY0YmFhYzJmN2U2ZDg4ZTA2MGIwMmRjNiJ9LCJpYXQiOjE3MDIxMDQ0ODgsImV4cCI6MTcwMjE0NzY4OH0.yafMj331quXyEvMs5h3hjbORvBSeVbuSA29zN6I_DFg'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/8.5465282/76.9151412/all-locations?limit=10&page=1'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
