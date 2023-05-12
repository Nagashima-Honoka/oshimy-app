import 'package:dio/dio.dart';

Future<void> _registerUser(String userName, String email, String uid, String prefecture, String city) async {
  final Dio dio = Dio();
  final String url = "https://your-api-url.com/register";

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
  } catch (e) {
    // エラーハンドリング
    print("Error occurred: $e");
  }
}
