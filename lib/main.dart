import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'navigation_home_screen.dart';


void main() async {
  // Firebase初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 最初に表示するWidget
  runApp(OshimaiApp());
}

class OshimaiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'Oshimai',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // ログイン画面を表示
      // home: LoginPage(),
      //ルーティング
      home: NavigationHomeScreen(),
    );
  }
}
//
// // ログイン画面用Widget
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   // メッセージ表示用
//   String infoText = '';
//   // 入力したメールアドレス・パスワード
//   String email = '';
//   String password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 // メッセージ表示
//                 child: const Text('Oshimai',
//                     style: TextStyle(
//                         fontSize: 70,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue
//                     )
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // メールアドレス入力
//               TextFormField(
//                 // テキスト入力のラベルを設定
//                 decoration: const InputDecoration(labelText: 'メールアドレス'),
//                 onChanged: (String value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//               ),
//               // パスワード入力
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'パスワード（6文字以上）'),
//                 // パスワードが見えないようにする
//                 obscureText: true,
//                 onChanged: (String value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//               ),
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 // メッセージ表示
//                 child: Text(infoText),
//               ),
//               SizedBox(
//                   width: double.infinity,
//                   // パスワード再設定ボタン
//                   child: TextButton(
//                     child: const Text('パスワードを忘れた方'),
//                     onPressed: () async {
//                       // TODO 処理追加
//                     },
//                   )
//               ),
//               const SizedBox(height: 8),
//               SizedBox(
//                 width: double.infinity,
//                 // ログイン登録ボタン
//                 child: ElevatedButton(
//                   child: const Text('ログインする'),
//                   onPressed: () async {
//                     try {
//                       // メール/パスワードでログイン
//                       final FirebaseAuth auth = FirebaseAuth.instance;
//                       await auth.signInWithEmailAndPassword(
//                         email: email,
//                         password: password,
//                       );
//                       // ログインに成功した場合
//                       // ホーム画面に遷移＋ログイン画面を破棄
//                       await Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) {
//                           return HomePage();
//                         }),
//                       );
//                     } catch (e) {
//                       // ログインに失敗した場合
//                       setState(() {
//                         infoText = "ログインに失敗しました：${e.toString()}";
//                       });
//                     }
//                   },
//                 ),
//               ),
//               const SizedBox(height: 8),
//               SizedBox(
//                 width: double.infinity,
//                 // ユーザー登録ボタン
//                 // TODO 別画面で登録画面を用意する必要がある。
//                 child: OutlinedButton(
//                   child: const Text('はじめての方はコチラ'),
//                   onPressed: () async {
//                     try {
//                       // メール/パスワードでユーザー登録
//                       final FirebaseAuth auth = FirebaseAuth.instance;
//                       await auth.createUserWithEmailAndPassword(
//                         email: email,
//                         password: password,
//                       );
//                       // ユーザー登録に成功した場合
//                       // ホーム画面に遷移＋ログイン画面を破棄
//                       await Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) {
//                           return HomePage();
//                         }),
//                       );
//                     } catch (e) {
//                       // ユーザー登録に失敗した場合
//                       // TODO エラー情報がダイレクトに表示されるので、エラーハンドリングが必要。
//                       setState(() {
//                         infoText = "登録に失敗しました：${e.toString()}";
//                       });
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//
// // Home画面用Widget
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //TODO 戻るボタンのためだけに今だけ存在する。AppBarは不要なので後で消す。
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.close),
//             onPressed: () async {
//               // ログイン画面に遷移＋Home画面を破棄
//               await Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) {
//                   return LoginPage();
//                 }),
//               );
//             },
//           ),
//         ],
//       ),
//       body: const Center(
//         child: SizedBox(
//           // TODO Home画面の実装
//           child: Text('Home画面',
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue
//               )
//           ),
//         ),
//       ),
//     //  TODO 下のバーの実装
//     //  TODO ログアウトの実装
//     //  TODO 一度ログインしたらどのくらいログインしっぱなしなのか問題
//     );
//   }
// }
