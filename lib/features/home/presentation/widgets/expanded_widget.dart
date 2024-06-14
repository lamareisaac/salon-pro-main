import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:saloon_pro/core/utils/navigation_helper.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../../core/components/my_spacing.dart';
import '../../../../core/components/my_text.dart';
import '../../../../core/utils/font.dart';
import '../../../message/presentation/widgets/home_messages.dart';
import '../../data/models/artist_appointment.dart';
import '../../data/models/customer_appointment_data_source.dart';

class ExpandedWidget extends StatefulWidget {
  const ExpandedWidget({super.key});

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  final DateTime date = DateTime.now();
  late List<CustomerAppointment> appointments;
  List<ArtistAppointment> artistAppointments = ArtistAppointment.generate();
  final CalendarController weekController = CalendarController();
  late DateTime selectedDay;
  DateTime? selectedMonth;

  @override
  void initState() {
    super.initState();
    DateTime rdv = DateTime.utc(2023, 10, 23, 20, 0);
    appointments = [];
    selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    double radiusSize = 30;
    double iconSize = 40;
    BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(radiusSize),
      topRight: Radius.circular(radiusSize),
    );
    appointments = ArtistAppointment.getListFromArtistList(artistAppointments);

    return Material(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: MaterialButton(
                      onPressed: () {
                        pushNavigation(context, const HomeMessages());
                      },
                      child: Image.asset(
                          'assets/images/icons/messenger-svgrepo-com1.png'),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Juin 2023',
                      style: TextStyle(
                        color: Colors.red.shade400,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      LucideIcons.chevronDown,
                      color: Colors.black.withAlpha(200),
                      size: 30,
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          LucideIcons.bell,
                          color: AppColors.black,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
              child: Container(
                color: AppColors.white,
                child: SfCalendar(
                  view: CalendarView.month,
                  headerHeight: 0,
                  firstDayOfWeek: 1,
                  showCurrentTimeIndicator: true,
                  cellBorderColor: Colors.transparent,
                  todayHighlightColor: AppColors.darkRed,
                  controller: weekController,
                  headerStyle: CalendarHeaderStyle(
                    textStyle: GoogleFonts.poppins(),
                  ),
                  showDatePickerButton: true,
                  showNavigationArrow: true,
                  initialSelectedDate: DateTime.now(),
                  selectionDecoration: BoxDecoration(
                    border: Border.all(color: AppColors.transparent),
                  ),
                  onSelectionChanged: (d) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        selectedDay = d.date ?? selectedDay;
                      });
                    });
                  },
                  cellEndPadding: 10,
                  monthCellBuilder: (context, details) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          clipBehavior: Clip.hardEdge,
                          padding:
                              MySpacing.symmetric(vertical: 6, horizontal: 6),
                          decoration: BoxDecoration(
                            color: selectedDay.day == details.date.day
                                ? AppColors.red
                                : AppColors.red.withAlpha(0),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: MyText.titleSmall(
                            details.date.day.toString(),
                            textAlign: TextAlign.center,
                            fontSize: 16,
                            color: selectedDay.day == details.date.day
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        ),
                      ],
                    );
                  },
                  monthViewSettings: MonthViewSettings(
                    showAgenda: true,
                    numberOfWeeksInView: 1,
                    agendaViewHeight: 0,
                    monthCellStyle: MonthCellStyle(
                      textStyle: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                    appointmentDisplayCount: 10,
                    appointmentDisplayMode: MonthAppointmentDisplayMode.none,
                    agendaStyle: AgendaStyle(
                      placeholderTextStyle:
                          GoogleFonts.poppins(color: AppColors.black),
                    ),
                  ),
                ),
              ),
            ),
            BarbiersList(
              customers: [...ArtistAppointment.generate()],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      color: AppColors.white,
                      child: SfCalendar(
                        headerHeight: 0,
                        viewHeaderHeight: 0,
                        controller: CalendarController(),
                        todayHighlightColor: Colors.red,
                        showCurrentTimeIndicator: true,
                        view: CalendarView.day,
                        dataSource: CustomerAppointmentDataSource(appointments),
                        appointmentBuilder:
                            (context, calendarAppointmentDetails) {
                          return Container(
                            child: Column(
                              children: [
                                MyText.titleMedium(
                                    '${calendarAppointmentDetails.appointments.first.name}')
                              ],
                            ),
                          );
                        },
                        // by default the month appointment display mode set as Indicator, we can
                        // change the display mode as appointment using the appointment display
                        // mode property
                        monthViewSettings: const MonthViewSettings(
                            appointmentDisplayMode:
                                MonthAppointmentDisplayMode.appointment),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BarbiersList extends StatelessWidget {
  final List<ArtistAppointment> customers;

  const BarbiersList({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MySpacing.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...customers.map((item) => BarbierItem(
                label: item.name,
                colorCircle: item.color,
              ))
        ],
      ),
    );
  }
}

class BarbierItem extends StatelessWidget {
  final String label;
  final double coloredCircleSize;
  final Color colorCircle;

  const BarbierItem({
    super.key,
    required this.label,
    this.coloredCircleSize = 15,
    this.colorCircle = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MySpacing.symmetric(horizontal: 8),
      child: Row(
        children: [
          Container(
            height: coloredCircleSize,
            width: coloredCircleSize,
            margin: MySpacing.only(right: 10),
            decoration: BoxDecoration(
              color: colorCircle,
              borderRadius: BorderRadius.circular(coloredCircleSize),
            ),
          ),
          MyText.labelSmall(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.black,
            ),
          )
        ],
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<_Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  String getEndTimeZone(int index) {
    return appointments![index].toZone;
  }

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
    return appointments![index].title;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class _Meeting {
  _Meeting(
      {required this.from,
      required this.to,
      this.title = '',
      this.isAllDay = false,
      required this.background,
      this.fromZone = '',
      this.toZone = '',
      this.exceptionDates,
      this.recurrenceRule = ''});
  DateTime from;
  DateTime to;
  String title;
  bool isAllDay;
  Color background;
  String fromZone;
  String toZone;
  String recurrenceRule;
  List<DateTime>? exceptionDates;
}
