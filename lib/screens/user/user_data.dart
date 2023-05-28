import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
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
  // String userName = '';
  // String oshimaiId = '';
  // DateTime birthday = DateTime(1900, 1, 1);
  // String gender = '';
  // String prefectureId = '';
  // String address = '';
  //TODO 将来的に、ユーザー情報が存在する場合はユーザーが情報を編集できるような作りにしたい
  //TODO 編集バージョンでは、好きな音楽ジャンルも編集できるようにしようかな

  //何か分かってないが初期化↓
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _addressController = TextEditingController();
  //ユーザー入力項目の初期化
  //？の書き方だと、null許容になってしまうらしい
  String? userName;
  String? oshimyId;
  DateTime birthday = DateTime(1900, 1, 1);
  String? gender;
  String? _selectedPrefecture;
  String? address;

  //TODO Firebaseからメールアドレスとuidを取得する実装
  String email = 'user@example.com';
  String uid = '1234567890';

  //TODO これは外だしして他でも使えるようにしたいな
  // Future<void> _registerUser() async {
  //   // ここでFirebase Authenticationからメールアドレスとuidを取得してください。
  //   //TODO Firebaseからメールアドレスとuidを取得する実装
  //   String email = 'user@example.com';
  //   String uid = '1234567890';
  //
  //   // dioを使ってAPIリクエストを行う
  //   final dio = Dio();
  //   dio.options.baseUrl = 'https://api.example.com';
  //
  //   //TODO ここはAPI側に情報を渡す処理なのかなあ？
  //   try {
  //     final response = await dio.post(
  //       '/register',
  //       data: {
  //         //TODO 順番とか後で修正必要？
  //         'username': _usernameController.text,
  //         'email': email,
  //         'uid': uid,
  //         'prefecture': _selectedPrefecture,
  //         'address': _addressController.text,
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // 登録成功
  //       print('User registered: ${response.data}');
  //     } else {
  //       // 登録失敗
  //       print('Failed to register user: ${response.data}');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  Future<void> _registerUser(String userName, String email, String uid, String prefecture, String city) async {
    final Dio dio = Dio();
    final String url = "https://your-api-url.com/register";

    //TODO 順番とか後で修正必要？
    final Map<String, dynamic> userData = {
      "username": userName,
      "email": email,
      "uid": uid,
      "address": {
        "prefecture": prefecture,
        "city": city,
      },
    };

    try {
      await dio.post(url, data: userData);
      // 登録成功後の処理をここに書く（例：ホーム画面へ遷移）
      //  TODO ここでは次の画面へ遷移を書くか（どのパスに行くかは引数でもらうとか）、Trueだけをreturnするか、どっちが良いかな
      print("API叩くの成功〜！");
    } catch (e) {
      // エラーハンドリング
      print("Error occurred: $e");
    }
  }

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
                          oshimyId = value;
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
                    // // 都道府県入力
                    // TextFormField(
                    //   // TODO 選択肢から選べるようにする
                    //   decoration: const InputDecoration(labelText: '都道府県'),
                    //   onChanged: (String value) {
                    //     setState(() {
                    //       prefectureId = value;
                    //     });
                    //   },
                    // ),
                    // // 市区町村入力
                    // TextFormField(
                    //   decoration: const InputDecoration(labelText: '市区町村'),
                    //   onChanged: (String value) {
                    //     setState(() {
                    //       address = value;
                    //     });
                    //   },
                    // ),
                    // DropdownButtonFormField(
                    //   //TODO 選択肢のこのUIどうなんかなあ…
                    //   hint: Text('都道府県'),
                    //   value: _selectedPrefecture,
                    //   items: _getPrefectures().map((String prefecture) {
                    //     return DropdownMenuItem<String>(
                    //       value: prefecture,
                    //       child: Text(prefecture),
                    //     );
                    //   }).toList(),
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       _selectedPrefecture = newValue;
                    //     });
                    //   },
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return '都道府県を選択してください';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(labelText: '市区町村'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '市区町村を入力してください';
                        }
                        return null;
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
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Form(
  //     key: _formKey,
  //     child: Column(
  //       children: <Widget>[
  //         TextFormField(
  //           controller: _usernameController,
  //           decoration: InputDecoration(labelText: 'ユーザー名'),
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return 'ユーザー名を入力してください';
  //             }
  //               return null;
  //           },
  //         ),
  //         DropdownButtonFormField(
  //           hint: Text('都道府県'),
  //           value: _selectedPrefecture,
  //           items: _getPrefectures().map((String prefecture) {
  //             return DropdownMenuItem<String>(
  //               value: prefecture,
  //               child: Text(prefecture),
  //             );
  //           }).toList(),
  //           onChanged: (String? newValue) {
  //             setState(() {
  //               _selectedPrefecture = newValue;
  //             });
  //           },
  //           validator: (value) {
  //             if (value == null) {
  //               return '都道府県を選択してください';
  //             }
  //               return null;
  //           },
  //         ),
  //         TextFormField(
  //           controller: _addressController,
  //           decoration: InputDecoration(labelText: '市区町村'),
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return '市区町村を入力してください';
  //             }
  //               return null;
  //           },
  //         ),
  //         ElevatedButton(
  //           onPressed: () {
  //             if (_formKey.currentState!.validate()) {
  //               _registerUser();
  //             }
  //           },
  //           child: Text('登録'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // List<String> _getPrefectures() {
  //   // 都道府県のリストを返す。実際にはAPIから取得する
  //   return [
  //     '北海道',
  //     '青森県',
  //     '岩手県',
  //     // ...他の都道府県
  //   ];
  // }

  // Future<List<String>> _fetchPrefectures() async {
  //   var api = YourApi(); // 生成されたクライアントコード内のAPIクラスをインスタンス化
  //   var response = await api.getPrefectures(); // APIクラス内の都道府県取得メソッドを呼び出す
  //
  //   // 必要に応じてレスポンスデータを変換してリストに格納
  //   List<String> prefectures = response.map((prefecture) => prefecture.name).toList();
  //
  //   return prefectures;
  // }


}