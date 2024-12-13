import 'dart:async';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _time = DateTime.now();

  void _startTime() {
    _upTime();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _upTime();
    });
  }

  void _upTime() {
    setState(() {
      _time = DateTime.now();
    });
  }

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          child: Row(
            children: [
              const Spacer(),
              Text(
                textAlign: TextAlign.left,
                '${_time.hour.toString().padLeft(2, '0')}:${_time.minute.toString().padLeft(2, '0')}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 80,
          child: Row(
            children: [
              const Spacer(),
              Text(
                textAlign: TextAlign.left,
                '${_time.day.toString().padLeft(2, '0')}.${_time.month.toString().padLeft(2, '0')}.${_time.year.toString().padLeft(2, '0')}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
