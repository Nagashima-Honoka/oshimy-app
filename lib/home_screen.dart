import 'package:oshimai/common/package_importer.dart';

// TODO:dateをセット
const anniversaryList = [
  {
    'type': '推し始めた日',
    'date': '2023-02-22'
  },
  {
    'type': '結成日',
    'date': '2023-02-22'
  },
];

// Home画面用Widget
class HomePage extends StatelessWidget {
  // TODO:推しグループ名を表示セット
  final String oshiGroupName = '推しグループ';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(appBarTitle: oshiGroupName),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(80)
                ),
                onPressed: () async {
                  await Navigator.of(context).pushNamed("/calendar");
                },
                child: const Center(
                  child: Text(
                    'カレンダー',
                    style: TextStyle(
                      fontSize: fontSizeCommon,
                    ),
                    textAlign: TextAlign.center
                  ),
                ),
              ),
            ),
            Container(
              // TODO:メンバーの数だけこの中に表示させる
              // TODO:推しは大アイコンにする
              height: 300,
              width: double.infinity,
              color: Colors.lightBlueAccent,
              child: const Center(
                child: Text('推し一覧を表示させる領域'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '記念日',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: fontSizeCommon,
                      fontWeight: FontWeight.bold,
                      fontFamily: AutofillHints.addressCity,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  // 登録済みの記念日を表示
                  for(var anniversary in anniversaryList)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: RichText(
                              text: TextSpan(
                                  children: [
                                    const WidgetSpan(
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.pink,
                                      ),
                                    ),
                                    TextSpan(
                                      text: anniversary['type'] as String,
                                      style: const TextStyle(
                                          fontSize: fontSizeCommon,
                                          color: Colors.black
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ),
                        Text(
                          anniversary['date'] as String,
                          style: const TextStyle(
                              fontSize: fontSizeCommon
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'メモ',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Placeholder()
                ],
              ),
            )
          ],
        ),
      ),
      //  TODO 下のバーの実装
      //  TODO ログアウトの実装
      //  TODO 一度ログインしたらどのくらいログインしっぱなしなのか問題
    );
  }
}