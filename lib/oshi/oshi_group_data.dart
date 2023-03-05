import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// 推しグループ登録画面用Widget
class OshiGroupData extends StatefulWidget {
  @override
  _OshiGroupDataState createState() => _OshiGroupDataState();
}

class _OshiGroupDataState extends State<OshiGroupData> {
  // メッセージ表示用
  String infoText = '';
  // 入力したデータ
  String group_header_image = '';
  String group_name = '';
  //TODO タレント名はリストにする
  String talent_name = '';
  String anniverary = '';
  DateTime anniverary_date = DateTime(1900, 1, 1);
  String group_memo = '';
  //TODO 将来的に、ユーザー情報が存在する場合はユーザーが情報を編集できるような作りにしたい

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('推しグループ登録'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                // TODO 戻るボタン・バツボタンの削除
                // TODO 背景を白色にしてテキストだけ表示
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
                      SizedBox(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //ヘッダー画像を登録
                                SizedBox(
                                  width: double.infinity,
                                  // TODO 画像を登録できるように実装
                                  //TODO スマホ画面の幅に合わせたサイズに変更できるようにする
                                  child: Image.asset(
                                    'asset/images/osshi_kun.png',
                                    width: 300,
                                    height: 300,
                                  ),
                                ),
                                // グループ名入力
                                TextFormField(
                                  decoration: const InputDecoration(labelText: 'グループ名'),
                                  onChanged: (String value) {
                                    setState(() {
                                      group_name = value;
                                    });
                                  },
                                ),
                                // タレント名入力
                                TextFormField(
                                  decoration: const InputDecoration(labelText: 'タレント名'),
                                  onChanged: (String value) {
                                    setState(() {
                                      talent_name = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  // 追加ボタン
                                  child: OutlinedButton(
                                    child: const Text('+'),
                                    //TODO 追加ボタンの実装
                                    onPressed: ()  { }
                                  ),
                                ),
                                // 記念日タイトル入力
                                TextFormField(
                                  decoration: const InputDecoration(labelText: '記念日タイトル'),
                                  onChanged: (String value) {
                                    setState(() {
                                      anniverary = value;
                                    });
                                  },
                                ),
                                // 記念日入力
                                TextButton.icon(
                                  // ボタンが押された時に表示する
                                  onPressed: () {
                                    DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        minTime: DateTime(1900, 1, 1),
                                        maxTime: DateTime(2049, 12, 31),
                                        onConfirm: (DateTime date) {
                                          setState(() {
                                            anniverary_date = date;
                                          });
                                          _OshiGroupDataState(); //新しい日付でデータを再取得する
                                        },
                                        currentTime: anniverary_date, locale: LocaleType.jp
                                    );
                                  },
                                  //TODO ここはカレンダーから選択できるようにしたいな
                                  // TODO 記念日の登録の実装
                                  icon: const Icon(
                                      Icons.event,
                                      color: Colors.blue,
                                      size: 30.0
                                  ),
                                  label: const Text('XXXX/XX/XX'),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  // 追加ボタン
                                  child: OutlinedButton(
                                    child: const Text('+'),
                                      //TODO 追加ボタンの実装
                                      onPressed: ()  { }
                                  ),
                                ),
                                //フリーメモ
                                TextFormField(
                                  decoration: const InputDecoration(labelText: 'フリーメモ'),
                                  onChanged: (String value) {
                                    setState(() {
                                      anniverary = value;
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
                                        // グループ登録後オッシーくんハンドリング画面に遷移＋この画面を破棄
                                        await Navigator.of(context).pushReplacementNamed("/home");
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