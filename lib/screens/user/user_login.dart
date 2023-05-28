import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ログイン画面用Widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                // アプリタイトル
                child: const Text('Oshimy',
                    style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                    )
                ),
              ),
              const SizedBox(height: 20),
              // メールアドレス入力
              TextFormField(
                // テキスト入力のラベルを設定
                decoration: const InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              // パスワード入力
              TextFormField(
                decoration: const InputDecoration(labelText: 'パスワード（6文字以上）'),
                // パスワードが見えないようにする
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
              ),
              SizedBox(
                  width: double.infinity,
                  // パスワード再設定ボタン
                  child: TextButton(
                    child: const Text('パスワードを忘れた方'),
                    onPressed: () async {
                      // パスワード設定画面に遷移
                      await Navigator.of(context).pushNamed("/password_edit");
                    },
                  )
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                // ログイン登録ボタン
                child: ElevatedButton(
                  child: const Text('ログインする'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでログイン
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ログインに成功した場合
                      // ホーム画面に遷移＋ログイン画面を破棄
                      await Navigator.of(context).pushReplacementNamed("/home");
                    } catch (e) {
                      // ログインに失敗した場合
                      setState(() {
                        infoText = "ログインに失敗しました：${e.toString()}";
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                // ユーザー登録ボタン
                child: TextButton(
                  child: const Text('はじめての方はこちら'),
                  onPressed: () async {
                    // ユーザー登録画面に遷移
                    await Navigator.of(context).pushNamed("/user_registration");
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}