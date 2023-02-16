import 'package:flutter/material.dart';

// Home画面用Widget
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          // TODO Home画面の実装
          child: Text('Home画面',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              )
          ),
        ),
      ),
      //  TODO 下のバーの実装
      //  TODO ログアウトの実装
      //  TODO 一度ログインしたらどのくらいログインしっぱなしなのか問題
    );
  }
}