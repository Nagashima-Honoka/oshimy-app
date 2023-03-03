import 'package:flutter/material.dart';

// 音楽ジャンル選択画面用Widget
class MusicCategorySelection extends StatefulWidget {
  @override
  _MusicCategorySelectionState createState() => _MusicCategorySelectionState();
}

class _MusicCategorySelectionState extends State<MusicCategorySelection> {
  // メッセージ表示用
  String infoText = '';
  // 入力したデータ
  String music_id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('音楽ジャンル選択'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () async {
              // TODO 戻るボタンの削除
              // TODO HOME画面にスキップするボタンの実装
              await Navigator.of(context).pushReplacementNamed("/oshi_registration_prompt");
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                // TODO 音楽ジャンル選択画面の実装
                child: Text('好きな音楽ジャンルを選んでね！',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  )
                ),
              ),
              // 音楽ジャンル入力
              TextFormField(
                // TODO 音楽ジャンルから選べるようにする
                decoration: const InputDecoration(labelText: '好きな音楽ジャンル'),
                onChanged: (String value) {
                  setState(() {
                    music_id = value;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                // エラーメッセージ表示
                // TODO エラーハンドリング
                // TODO 各項目バリデーション
                child: Text(infoText),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                // 登録ボタン
                child: ElevatedButton(
                  child: const Text('登録'),
                  onPressed: () async {
                    try {
                      //TODO 登録処理
                      // 登録に成功した場合
                      // 音楽ジャンル選択画面に遷移＋ユーザー詳細登録画面を破棄
                      await Navigator.of(context).pushReplacementNamed("/oshi_registration_prompt");
                    } catch (e) {
                      // 登録に失敗した場合
                      setState(() {
                        infoText = "登録に失敗しました：${e.toString()}";
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}