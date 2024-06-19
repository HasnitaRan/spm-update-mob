import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:spinemotion_app/pages/homepage/home_page.dart';
import 'package:spinemotion_app/utils/api_endpoints.dart';
import 'package:spinemotion_app/utils/routers.dart';

class LoginProvider extends ChangeNotifier {
  String requestBaseUrl = ApiEndPoints.baseUrl;

  //Setter
  bool _isLoading = false;
  String _resMessage = '';

// Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void loginUser(
      {
        required String email,
        required String password,
        BuildContext? context}) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/user/login";

    final body = {
      "email" : email,
      "password" : password,
    };

    print(jsonEncode(body));

    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};

      http.Response req = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        _isLoading = false;
        _resMessage = "Berhasil masuk";
        notifyListeners();
        PageNavigator(ctx: context).nextPageOnly(page: HomePage());
      } else {
        final res = jsonDecode(req.body);

        print(res);
        _isLoading = false;
        _resMessage = res["message"];
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available";
      notifyListeners();

    } catch (e) {
      _isLoading = false;
      _resMessage ="Please try again";
      notifyListeners();
    }
  }
  void clear() {
    _resMessage = '';
    notifyListeners();
  }
}