import 'package:oshimai/common/package_importer.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final String oshiGroupName = '推しグループ'; // TODO:推しグループ名を表示セット
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(appBarTitle: widget.oshiGroupName),
      body: TableCalendar(
        firstDay: DateTime(2023, 1, 1),
        lastDay: DateTime(2030, 12, 31),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
