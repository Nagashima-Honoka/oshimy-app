import 'package:flutter/material.dart';

// 推しグループ登録後オッシーくんハンドリング画面用Widget
class OshiGroupRegistrationPrompt extends StatelessWidget {
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
                    //TODO 吹き出しをつけたい
                    child: Text(
                      '登録おつかれさま！\n'
                          '推しメンバーの詳細も\n'
                          '登録しておく？',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    // メッセージ表示
                    child: Image.asset(
                      'asset/images/osshi_kun.png',
                      width: 300,
                      height: 300,
                    ),
                  ),
                  SizedBox(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //TODO 間隔を少し開けたい
                            SizedBox(
                              width: 120,
                              height: 130,
                              child: OutlinedButton(
                                onPressed: (){
                                  // グループ登録画面に遷移＋この画面を破棄
                                  Navigator.of(context).pushReplacementNamed("/home");
                                },
                                child: const Text('後にする'),
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              height: 130,
                              child: OutlinedButton(
                                onPressed: (){
                                  // ソロ登録画面に遷移＋この画面を破棄
                                  Navigator.of(context).pushReplacementNamed("/");
                                },
                                child: const Text('推しメン登録へ'),
                              ),
                            )
                          ]
                      )
                  ),
                ]
            )
        ),
      ),
    );
  }
}