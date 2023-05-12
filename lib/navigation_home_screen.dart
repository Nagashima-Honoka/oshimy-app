import 'package:flutter/material.dart';
import 'package:oshimai/screens/calendar.dart';
import 'package:oshimai/screens/user/user_login.dart';
import 'package:oshimai/screens/user/password_edit.dart';
import 'package:oshimai/screens/user/user_registration.dart';
import 'package:oshimai/screens/user/user_data.dart';
import 'package:oshimai/screens/user/music_category_selection.dart';
import 'package:oshimai/screens/instruction/user_registration_prompt.dart';
import 'package:oshimai/screens/home_screen.dart';
import 'package:oshimai/screens/oshi/oshi_group_data.dart';
import 'package:oshimai/screens/instruction/oshi_group_registration_prompt.dart';
import 'package:oshimai/screens/splash_screen.dart';

class NavigationHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //デバイスのサイズを計測
    final double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'SafeArea Sample',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        //TODO ログインページはログインしていない時のみ表示するように変更が必要
        '/login': (context) => LoginPage(),
        '/password_edit': (context) => PasswordEdit(),
        '/user_registration': (context) => UserRegistration(),
        '/user_data': (context) => UserData(),
        '/music_category_selection': (context) => MusicCategorySelection(),
        '/user_registration_prompt': (context) => UserRegistrationPrompt(),
        '/home': (context) => HomePage(),
        '/oshi_group_data': (context) => OshiGroupData(),
        '/oshi_group_registration_prompt': (context) => OshiGroupRegistrationPrompt(),
        '/calendar': (context) => Calendar(),
      },
    );
  }
}
