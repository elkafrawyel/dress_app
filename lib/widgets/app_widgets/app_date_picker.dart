import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text.dart';

showAppDateDialog({
  required BuildContext context,
  required Function(DateTime? date) onDatePicked,
  DateTime? initialDate,
  bool withTime = false,
  bool allowPastDates = true,
  bool allowFutureDates = true,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => _DatePickerDialog(
      onDatePicked: onDatePicked,
      initialDate: initialDate,
      withTime: withTime,
      allowPastDates: allowPastDates,
      allowFutureDates: allowFutureDates,
    ),
  );
}

enum TimePickMode {
  past,
  future,
  normal,
}

class _DatePickerDialog extends StatefulWidget {
  final Function(DateTime? date) onDatePicked;
  final DateTime? initialDate;
  final bool withTime;
  final bool allowPastDates, allowFutureDates;

  const _DatePickerDialog({
    Key? key,
    required this.onDatePicked,
    this.initialDate,
    this.withTime = false,
    this.allowPastDates = true,
    this.allowFutureDates = true,
  }) : super(key: key);

  @override
  State<_DatePickerDialog> createState() => _DatePickerDialogState();
}

class _DatePickerDialogState extends State<_DatePickerDialog> {
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: Get.isDarkMode ? Brightness.dark : Brightness.light,
      ),
      child: CupertinoActionSheet(
        cancelButton: CupertinoButton(
          color: Theme.of(context).scaffoldBackgroundColor,
          onPressed: () {
            Navigator.pop(context);
            widget.onDatePicked(dateTime);
          },
          child: AppText(
            'submit'.tr,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 200,
            child: CupertinoDatePicker(
              dateOrder: DatePickerDateOrder.dmy,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              mode: widget.withTime ? CupertinoDatePickerMode.dateAndTime : CupertinoDatePickerMode.date,
              initialDateTime: widget.initialDate ?? DateTime.now(),
              minimumDate: widget.allowPastDates
                  ? DateTime(1950)
                  : DateTime.now().subtract(
                      const Duration(milliseconds: 100),
                    ),
              maximumDate: widget.allowFutureDates ? DateTime(2050) : DateTime.now(),
              onDateTimeChanged: (DateTime picked) {
                setState(() => dateTime = picked);
              },
            ),
          ),
        ],
      ),
    );
  }
}
