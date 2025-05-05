import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/presentation/dashboard/subscreens/symptoms/log_symptoms_screen.dart';

class Last7DaysWidget extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const Last7DaysWidget({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<Last7DaysWidget> createState() => _Last7DaysWidgetState();
}

class _Last7DaysWidgetState extends State<Last7DaysWidget> {
  late List<DateTime> last7Days;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    last7Days = List.generate(7, (i) => today.subtract(Duration(days: 6 - i)));
  }

  String getDynamicText(DateTime date) {
    // Example logic: you can customize this
    if (date == last7Days.last) {
      return 'Today: High chance of getting pregnant';
    } else if (date.isAfter(last7Days.last.subtract(Duration(days: 4)))) {
      return 'Ovulation in ${last7Days.last.difference(date).inDays} days';
    } else {
      return 'Low chance of getting pregnant';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(
        bottom: AppSizes.vertical_20,
        left: AppSizes.horizontal_15,
        right: AppSizes.horizontal_15,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.whiteColor.withOpacity(0),
            AppColors.primaryColor.withOpacity(0.25),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: last7Days.length,
              itemBuilder: (context, index) {
                final date = last7Days[index];
                final isSelected = date.day == widget.selectedDate.day &&
                    date.month == widget.selectedDate.month &&
                    date.year == widget.selectedDate.year;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.onDateSelected(date);
                    });
                  },
                  child: Container(
                    width: 40,
                    margin: const EdgeInsets.only(
                      top: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.pink : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          _weekdayShort(date.weekday),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(),
          SubtitleText(
            weight: FontWeight.w600,
            text: getDynamicText(widget.selectedDate),
          ),
          CustomButton(
            width: 160,
            height: 36,
            fontSize: 16,
            borderRadius: 16,
            text: 'Log symptoms',
            onTapHandler: () {
              Get.to(() => const LogVellaScreen());
            },
            fontWeight: FontWeight.w600,
            fontColor: AppColors.whiteColor,
            backgroundColor: AppColors.buttonPrimaryColor,
          ),
          SizedBox(),
        ],
      ),
    );
  }

  String _weekdayShort(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }
}
