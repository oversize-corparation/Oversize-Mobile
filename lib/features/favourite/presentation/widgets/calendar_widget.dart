import 'package:intl/intl.dart';
import 'package:oversize/features/app/app_export.dart';

class CalendarWidget extends StatefulWidget {
  final void Function(DateTime selectedDate) onDateSelected;

  const CalendarWidget({super.key, required this.onDateSelected});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _currentDate = DateTime.now();

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
    });
  }

  List<Widget> _buildDays() {
    final days = <Widget>[];
    final totalDays = DateUtils.getDaysInMonth(
      _currentDate.year,
      _currentDate.month,
    );
    final firstDayOfMonth = DateTime(_currentDate.year, _currentDate.month, 1);
    final weekdayOfFirst = firstDayOfMonth.weekday;

    for (int i = 1; i < weekdayOfFirst; i++) {
      days.add(const SizedBox(width: 40, height: 40));
    }

    for (int day = 1; day <= totalDays; day++) {
      final date = DateTime(_currentDate.year, _currentDate.month, day);
      final isToday =
          date.day == DateTime.now().day &&
          date.month == DateTime.now().month &&
          date.year == DateTime.now().year;
      days.add(
        GestureDetector(
          onTap: () {
            widget.onDateSelected(date);
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(4),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isToday ? AppColor.circlePink : AppColor.lightGray100,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              day.toString().padLeft(2, '0'),
              style: TextStyle(
                fontSize: 14,
                color: isToday ? AppColor.deepPurple : Colors.black,
              ),
            ),
          ),
        ),
      );
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.deepPurple,
                      ),
                      onPressed: _previousMonth,
                    ),
                    Text(
                      DateFormat('MMMM').format(_currentDate),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColor.deepPurple,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.deepPurple,
                      ),
                      onPressed: _nextMonth,
                    ),
                  ],
                ),
                10.h,
                Wrap(alignment: WrapAlignment.center, children: _buildDays()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
