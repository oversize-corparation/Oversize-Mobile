import 'package:intl/intl.dart';
import 'package:oversize/features/app/app_export.dart';

class CustomCalendar extends StatefulWidget {
  final void Function(DateTime selectedDate) onDateSelected;

  const CustomCalendar({super.key, required this.onDateSelected});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _currentMonth = DateTime.now();
  DateTime? _selectedDate = DateTime.now();

  List<DateTime> _getDaysInMonth(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final daysBefore = (firstDay.weekday + 1) % 7;
    final firstToDisplay = firstDay.subtract(Duration(days: daysBefore));

    final lastDay = DateTime(month.year, month.month + 1, 0);
    final daysAfter = 6 - (lastDay.weekday % 7);
    final lastToDisplay = lastDay.add(Duration(days: daysAfter));

    return List.generate(
      lastToDisplay.difference(firstToDisplay).inDays + 1,
      (i) => firstToDisplay.add(Duration(days: i)),
    );
  }

  void _prevMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = _getDaysInMonth(_currentMonth);
    final monthName = DateFormat.MMMM().format(_currentMonth);

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.05)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navButton(Icons.arrow_back_ios_new, _prevMonth),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.deepPurple),
                  borderRadius: BorderRadius.circular(25),
                  color: AppColor.lightPink,
                ),
                child: Text(
                  monthName,
                  style: TextStyle(fontSize: 16, color: AppColor.deepPurple),
                ),
              ),
              _navButton(Icons.arrow_forward_ios, _nextMonth),
            ],
          ),
          SizedBox(height: 10),
          Wrap(
            // alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: days.map((day) {
              final isSelected =
                  _selectedDate != null &&
                  day.year == _selectedDate!.year &&
                  day.month == _selectedDate!.month &&
                  day.day == _selectedDate!.day;

              final isThisMonth = day.month == _currentMonth.month;

              return GestureDetector(
                onTap: () {
                  if (isThisMonth) {
                    setState(() {
                      _selectedDate = day;
                      widget.onDateSelected(day);
                    });
                  }
                },
                child: Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColor.lightPink
                        : Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    day.day.toString().padLeft(2, '0'),
                    style: TextStyle(
                      color: isThisMonth
                          ? (isSelected ? AppColor.deepPurple : Colors.black)
                          : Colors.grey,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _navButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.lightPink,
        ),
        child: Icon(icon, size: 18, color: AppColor.deepPurple),
      ),
    );
  }
}
