import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// ユーザー詳細画面用Widget
class UserData extends StatefulWidget {
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  // メッセージ表示用
  String infoText = '';
  // 入力したデータ
  String userName = '';
  String oshimaiId = '';
  DateTime birthday = DateTime(1900, 1, 1);
  String gender = '';
  String prefectureId = '';
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
              const SizedBox(
                // メッセージ表示
                child: Text('あなたのことを教えてね！',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                    )
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // ユーザー名入力
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'ユーザー名'),
                      onChanged: (String value) {
                        setState(() {
                          userName = value;
                        });
                      },
                    ),
                    // oshimaiID入力
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'オシマイID'),
                      onChanged: (String value) {
                        setState(() {
                          oshimaiId = value;
                        });
                      },
                    ),
                    // 生年月日入力
                    TextButton.icon(
                      // ボタンが押された時に表示する
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1900, 1, 1),
                            maxTime: DateTime(2049, 12, 31),
                            onConfirm: (DateTime date) {
                              setState(() {
                                birthday = date;
                              });
                              _UserDataState(); //新しい日付でデータを再取得する
                            },
                            currentTime: birthday, locale: LocaleType.jp
                        );
                      },
                      // TODO 生年月日の登録の実装
                      icon: const Icon(
                          Icons.event,
                          color: Colors.blue,
                          size: 30.0
                      ),
                      label: const Text('生年月日'),
                    ),
                    // 性別入力
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //TODO 性別登録の実装
                          OutlinedButton.icon(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.female,
                              color: Colors.blue,
                              size: 30.0
                            ),
                            label: const Text('女の子'),
                          ),
                          OutlinedButton.icon(
                            onPressed: (){},
                            icon: const Icon(
                                Icons.male,
                                color: Colors.blue,
                                size: 30.0
                            ),
                            label: const Text('男の子'),
                          ),
                          OutlinedButton.icon(
                            onPressed: (){},
                            icon: const Icon(
                                Icons.transgender,
                                color: Colors.blue,
                                size: 30.0
                            ),
                            label: const Text('トランス'),
                          ),
                        ]
                      )
                    ),
                    // 都道府県入力
                    TextFormField(
                      // TODO 選択肢から選べるようにする
                      decoration: const InputDecoration(labelText: '都道府県'),
                      onChanged: (String value) {
                        setState(() {
                          prefectureId = value;
                        });
                      },
                    ),
                    // 市区町村入力
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
            ]
          )
        )
      )
    );
  }
}