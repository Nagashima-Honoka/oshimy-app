import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/firebase_options.dart';
import 'navigation_home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  // Firebase初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'oshimai-dev',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ローカライズ
  // 最初に表示するWidget
  initializeDateFormatting().then((_) => runApp(OshimaiApp()));
}

class OshimaiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'Oshimai',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // ログイン画面を表示
      // home: LoginPage(),
      //ルーティング
      home: NavigationHomeScreen(),
    );
  }
}
