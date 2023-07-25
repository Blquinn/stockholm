import 'package:flutter/cupertino.dart';
import 'package:stockholm/src/constrained_inputs.dart';

// Value inspected from Xcode 11 & iOS 13.0 Simulator.
const BorderSide _kDefaultRoundedBorderSide = BorderSide(
  color: CupertinoDynamicColor.withBrightness(
    color: Color(0x33000000),
    darkColor: Color(0x33FFFFFF),
  ),
  width: 0.0,
);
const Border _kDefaultRoundedBorder = Border(
  top: _kDefaultRoundedBorderSide,
  bottom: _kDefaultRoundedBorderSide,
  left: _kDefaultRoundedBorderSide,
  right: _kDefaultRoundedBorderSide,
);

const BoxDecoration _kDefaultRoundedBorderDecoration = BoxDecoration(
  color: CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.white,
    darkColor: CupertinoColors.black,
  ),
  border: _kDefaultRoundedBorder,
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
);

enum StockholmDateTimePickerComponent {
  date,
  time,
  seconds,
}

class StockholmDateTimePicker extends StatefulWidget {
  const StockholmDateTimePicker({
    required this.dateTime,
    required this.onChanged,
    this.components = const {
      StockholmDateTimePickerComponent.date,
      StockholmDateTimePickerComponent.time,
      StockholmDateTimePickerComponent.seconds,
    },
    super.key,
  });

  final DateTime dateTime;
  final void Function(DateTime) onChanged;
  final Set<StockholmDateTimePickerComponent> components;

  @override
  State<StockholmDateTimePicker> createState() =>
      _StockholmDateTimePickerState();
}

class _StockholmDateTimePickerState extends State<StockholmDateTimePicker> {
  late int _year;
  late int _month;
  late int _day;
  late int _hour;
  late int _minute;
  late int _second;

  DateTime? _lastDateTime;

  @override
  void initState() {
    super.initState();
    _year = widget.dateTime.year;
    _month = widget.dateTime.month;
    _day = widget.dateTime.day;
    _hour = widget.dateTime.hour;
    _minute = widget.dateTime.minute;
    _second = widget.dateTime.second;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.components.contains(StockholmDateTimePickerComponent.date))
          Container(
            decoration: _kDefaultRoundedBorderDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 42,
                  child: StockholmIntInput(
                    drawBorder: false,
                    maxLength: 4,
                    value: widget.dateTime.year,
                    textAlign: TextAlign.center,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    padValue: true,
                    selectAllOnFocus: true,
                    onChanged: (year) {
                      if (year > 9999) {
                        year = 9999;
                      } else if (year < 0) {
                        year = 0;
                      }
                      _year = year;
                    },
                    onFilled: () {
                      _nextFocus(context);
                    },
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        _updateDateTime(true);
                      }
                    },
                  ),
                ),
                const Text('-'),
                SizedBox(
                  width: 20,
                  child: StockholmIntInput(
                    drawBorder: false,
                    maxLength: 2,
                    value: widget.dateTime.month,
                    textAlign: TextAlign.center,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    padValue: true,
                    selectAllOnFocus: true,
                    onChanged: (month) {
                      if (month > 12) {
                        month = 12;
                      } else if (month < 0) {
                        month = 0;
                      }
                      _month = month;
                    },
                    onFilled: () {
                      _nextFocus(context);
                    },
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        _updateDateTime(true);
                      }
                    },
                  ),
                ),
                const Text('-'),
                SizedBox(
                  width: 20,
                  child: StockholmIntInput(
                    drawBorder: false,
                    maxLength: 2,
                    value: widget.dateTime.day,
                    textAlign: TextAlign.center,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    padValue: true,
                    selectAllOnFocus: true,
                    onChanged: (day) {
                      if (day > 31) {
                        day = 31;
                      } else if (day < 1) {
                        day = 1;
                      }
                      _day = day;
                    },
                    onFilled: () {
                      if (widget.components
                          .contains(StockholmDateTimePickerComponent.time)) {
                        _nextFocus(context);
                      }
                    },
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        _updateDateTime(true);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        if (widget.components.contains(StockholmDateTimePickerComponent.date))
          const SizedBox(width: 4),
        if (widget.components.contains(StockholmDateTimePickerComponent.time))
          Container(
            decoration: _kDefaultRoundedBorderDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  child: StockholmIntInput(
                    drawBorder: false,
                    maxLength: 2,
                    value: widget.dateTime.hour,
                    textAlign: TextAlign.center,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    padValue: true,
                    selectAllOnFocus: true,
                    onChanged: (hour) {
                      if (hour > 23) {
                        hour = 23;
                      } else if (hour < 0) {
                        hour = 0;
                      }
                      _hour = hour;
                    },
                    onFilled: () {
                      _nextFocus(context);
                    },
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        _updateDateTime(true);
                      }
                    },
                  ),
                ),
                const Text(':'),
                SizedBox(
                  width: 20,
                  child: StockholmIntInput(
                    drawBorder: false,
                    maxLength: 2,
                    value: widget.dateTime.minute,
                    textAlign: TextAlign.center,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    padValue: true,
                    selectAllOnFocus: true,
                    onChanged: (minute) {
                      if (minute > 59) {
                        minute = 59;
                      } else if (minute < 0) {
                        minute = 0;
                      }
                      _minute = minute;
                    },
                    onFilled: () {
                      if (widget.components
                          .contains(StockholmDateTimePickerComponent.seconds)) {
                        _nextFocus(context);
                      }
                    },
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        _updateDateTime(true);
                      }
                    },
                  ),
                ),
                if (widget.components
                    .contains(StockholmDateTimePickerComponent.seconds))
                  const Text(':'),
                if (widget.components
                    .contains(StockholmDateTimePickerComponent.seconds))
                  SizedBox(
                    width: 20,
                    child: StockholmIntInput(
                      drawBorder: false,
                      maxLength: 2,
                      value: widget.dateTime.second,
                      textAlign: TextAlign.center,
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      padValue: true,
                      selectAllOnFocus: true,
                      onChanged: (second) {
                        if (second > 59) {
                          second = 59;
                        } else if (second < 0) {
                          second = 0;
                        }
                        _second = second;
                      },
                      onFocusChange: (hasFocus) {
                        if (!hasFocus) {
                          _updateDateTime(true);
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _year = widget.dateTime.year;
    _month = widget.dateTime.month;
    _day = widget.dateTime.day;
    _hour = widget.dateTime.hour;
    _minute = widget.dateTime.minute;
    _second = widget.dateTime.second;
  }

  void _updateDateTime(bool notify) {
    var dateTime = DateTime(
      _year,
      _month == 0 ? 1 : _month,
      _day,
      _hour,
      _minute,
      _second,
    );

    if (_lastDateTime == dateTime) {
      return;
    }

    _year = dateTime.year;
    _month = dateTime.month;
    _day = dateTime.day;
    _hour = dateTime.hour;
    _minute = dateTime.minute;
    _second = dateTime.second;

    if (notify) {
      widget.onChanged(dateTime);
      _lastDateTime = dateTime;
      setState(() {});
    }
  }

  void _nextFocus(BuildContext context) {
    FocusScope.of(context).nextFocus();
    _updateDateTime(false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged(_lastDateTime!);
    });
  }
}
