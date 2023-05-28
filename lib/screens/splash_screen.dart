import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  //宣言
  late AnimationController _backgroundController;
  late Animation<double> _backgroundAnimation;
  late AnimationController _fadeOutController;
  late Animation<double> _fadeOutAnimation;

  //ウィジェット作成の際に呼ばれる。
  @override
  void initState() {
    super.initState();

    //初期化
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _backgroundAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_backgroundController);

    _fadeOutController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeOutAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_fadeOutController);

    _backgroundController.forward();

    Timer(const Duration(seconds: 3), () {
      _fadeOutController.forward().whenComplete(() {
        Navigator.of(context).pushReplacementNamed("/login");
      });
    });
  }

  //ウィジェットが破棄される際に呼ばれる。_controllerのリソースを解放するために、disposeメソッドを呼び出しています。
  //TODO これって他の画面でも使った方がいいものなのかな？
  @override
  void dispose() {
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // フェードインするFadeTransition ウィジェット（背景画像とタイトル画像）を
          // フェードアウトするFadeTransition ウィジェットでラップします。
          FadeTransition(
            opacity: _fadeOutAnimation,
            child: Stack(
              children: [
                FadeTransition(
                  opacity: _backgroundAnimation,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        //TODO　ここの画像、ピンクと黄色のじんわり背景に変更する必要あり
                        image: AssetImage('asset/images/splash_screen.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
