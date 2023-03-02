import 'package:flutter/material.dart';

// ユーザー詳細画面用Widget
class UserData extends StatefulWidget {
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  // メッセージ表示用
  String infoText = '';
  // 入力したデータ
  String user_name = '';
  String oshimai_id = '';
  String birthday = '';
  String gender = '';
  String prefecture_id = '';
  String address = '';
  //TODO 将来的に、ユーザー情報が存在する場合はユーザーが情報を編集できるような作りにしたい
  //TODO 編集バージョンでは、好きな音楽ジャンルも編集できるようにしようかな

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
                // メッセージ表示
                child: const Text('あなたのことを教えてね！',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                    )
                ),
              ),
              // ユーザー名入力
              TextFormField(
                decoration: const InputDecoration(labelText: 'ユーザー名'),
                onChanged: (String value) {
                  setState(() {
                    user_name = value;
                  });
                },
              ),
              // oshimaiID入力
              TextFormField(
                decoration: const InputDecoration(labelText: 'オシマイID'),
                onChanged: (String value) {
                  setState(() {
                    oshimai_id = value;
                  });
                },
              ),
              // 生年月日入力
              TextFormField(
                // TODO カレンダーから選べるようにする
                decoration: const InputDecoration(labelText: '生年月日'),
                onChanged: (String value) {
                  setState(() {
                    birthday = value;
                  });
                },
              ),
              // 性別入力
              TextFormField(
                // TODO 選択肢から選べるようにする
                decoration: const InputDecoration(labelText: '性別'),
                onChanged: (String value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              // 都道府県入力
              TextFormField(
                // TODO 選択肢から選べるようにする
                decoration: const InputDecoration(labelText: '都道府県'),
                onChanged: (String value) {
                  setState(() {
                    prefecture_id = value;
                  });
                },
              ),
              // oshimaiID入力
              TextFormField(
                decoration: const InputDecoration(labelText: '市区町村'),
                onChanged: (String value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                // エラーメッセージ表示
                // TODO エラーハンドリング
                // TODO 各項目バリデーション
                // TODO 必須か必須でないかチェック
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
                      await Navigator.of(context).pushReplacementNamed("/music_category_selection");
                    } catch (e) {
                      // 登録に失敗した場合
                      setState(() {
                        infoText = "登録に失敗しました：${e.toString()}";
                      });
                    }
                  },
                ),
              ),
            ]
          )
        )
      )
    );
  }
}