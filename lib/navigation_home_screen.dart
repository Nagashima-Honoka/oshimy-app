import 'package:flutter/material.dart';
import 'package:oshimai/user/user_login.dart';
import 'package:oshimai/user/password_edit.dart';
import 'package:oshimai/user/user_registration.dart';
import 'package:oshimai/user/user_data.dart';
import 'package:oshimai/user/music_category_selection.dart';
import 'home_screen.dart';

class NavigationHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeArea Sample',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        //TODO ログインページはログインしていない時のみ表示するように変更が必要
        '/': (context) => LoginPage(),
        // '/login': (context) => LoginPage(),
        '/password_edit': (context) => PasswordEdit(),
        '/user_registration': (context) => UserRegistration(),
        '/user_data': (context) => UserData(),
        '/music_category_selection': (context) => MusicCategorySelection(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
