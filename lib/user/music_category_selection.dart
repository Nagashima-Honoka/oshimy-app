import 'package:flutter/material.dart';

// 音楽ジャンル選択画面用Widget
class MusicCategorySelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('音楽ジャンル選択'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              // TODO HOME画面にスキップするボタンの実装
              await Navigator.of(context).pushReplacementNamed("/home");
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              // TODO 音楽ジャンル選択画面の実装
              child: Text('音楽ジャンル選択画面',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                )
              ),
            ),
            SizedBox(
              width: double.infinity,
              // 登録完了ボタン
              child: TextButton(
                child: const Text('登録完了'),
                onPressed: () async {
                  // Home画面に遷移
                  await Navigator.of(context).pushNamed("/home");
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}