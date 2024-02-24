import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    //Cek apakah pengguna sudah login atau memiliki token
    _isLoggedIn().then((isLoggedIn){
      _hasToken().then((hasToken){
        if (!isLoggedIn || !hasToken) {
          //Jika tidak login atau tidak memiliki token, redirect ke halaman login
          Get.offNamed('/login');
        }
      });
    });
    //Jika sudah login dan memiliki token, biarkan akses ke halaman yang di minta
  }

  Future<bool> _isLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');
    return token != null;
  }

  Future<bool> _hasToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');
    return token != null;
  }
}