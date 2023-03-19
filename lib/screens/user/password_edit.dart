import 'package:flutter/material.dart';

// パスワード再設定画面用Widget
class PasswordEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              // ログイン画面に遷移＋パスワード再設定画面を破棄
              await Navigator.of(context).pushReplacementNamed("/");
            },
          ),
        ],
      ),
      body: const Center(
        child: SizedBox(
          // TODO パスワード再設定画面の実装
          child: Text('パスワード再設定画面',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              )
          ),
        ),
      ),
    );
  }
}