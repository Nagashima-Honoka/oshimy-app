import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'navigation_home_screen.dart';


void main() async {
  // Firebase初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'oshimai-dev',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 最初に表示するWidget
  runApp(OshimaiApp());
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
