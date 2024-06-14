import 'package:flutter/material.dart';
import 'package:saloon_pro/features/home/data/models/artist_appointment.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/utils/font.dart';

class CustomerAppointmentDataSource extends CalendarDataSource {
  CustomerAppointmentDataSource(List<CustomerAppointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
  }

  @override
  Color getColor(int index) {
    return AppColors.appointsColors[index].withOpacity(0.6);
  }

  // @override
  // String getEndTimeZone(int index) {
  //   return appointments![index].toZone;
  // }

  // @override
  // List<DateTime> getRecurrenceExceptionDates(int index) {
  //   return appointments?[index]?.exceptionDates ?? [];
  // }

  // @override
  // String getRecurrenceRule(int index) {
  //   return appointments![index].recurrenceRule;
  // }

  // @override
  // String getStartTimeZone(int index) {
  //   return appointments![index].fromZone;
  // }

  @override
  String getSubject(int index) {
    return appointments![index].name;
  }

  @override
  bool isAllDay(int index) {
    return false;
    // return appointments![index].isAllDay;
  }
}
