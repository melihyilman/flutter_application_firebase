import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MedicineTimesWidget extends StatelessWidget {
  const MedicineTimesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.day,
      showCurrentTimeIndicator: false,
      dataSource: MeetingDataSource(_getDataSource()),
      // by default the month appointment display mode set as Indicator, we can
      // change the display mode as appointment using the appointment display
      // mode property
      firstDayOfWeek: 1,
      headerHeight: 100,
      timeSlotViewSettings: TimeSlotViewSettings(
          timeIntervalHeight: 80, timeFormat: 'h:mm', startHour: 7),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime start8Time = DateTime(today.year, today.month, today.day, 8);
    final DateTime end8Time = start8Time.add(const Duration(minutes: 30));
    meetings.add(Meeting('''DeltaCortil x3\r\nNorvasc x1''', start8Time,
        end8Time, const Color(0xFF0F8644), false));

    final DateTime start10Time =
        DateTime(today.year, today.month, today.day, 10);
    final DateTime end10Time = start10Time.add(const Duration(minutes: 30));
    meetings.add(Meeting('''Adoport x4,5\r\nMyFortic x2''', start10Time,
        end10Time, Colors.brown, false));

    final DateTime start14Time =
        DateTime(today.year, today.month, today.day, 14);
    final DateTime end14Time = start14Time.add(const Duration(minutes: 30));
    meetings.add(
        Meeting('''Citovir x2''', start14Time, end14Time, Colors.pink, false));

    final DateTime start18Time =
        DateTime(today.year, today.month, today.day, 18, 30);
    final DateTime end18Time = start18Time.add(const Duration(minutes: 30));
    meetings.add(Meeting(
        '''Cardura x1''', start18Time, end18Time, Colors.purple, false));

    final DateTime start22Time =
        DateTime(today.year, today.month, today.day, 22);
    final DateTime end22Time = start14Time.add(const Duration(minutes: 30));
    meetings.add(Meeting('''Adaport x4,5\r\nMyFortic x2''', start22Time,
        end22Time, Colors.blueAccent, false));

    final String recipe =
        (today.weekday == DateTime.monday || today.weekday == DateTime.thursday)
            ? "Bactrim x1\r\nPantpas x1"
            : "Bactrim x1";

    final DateTime start23Time =
        DateTime(today.year, today.month, today.day, 23);
    final DateTime end23Time = start14Time.add(const Duration(minutes: 30));
    meetings.add(Meeting(recipe, start23Time, end23Time, Colors.orange, false));
    return meetings;
  }
  //   return  Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: () => Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (_) => const DailyTimeline(),
  //               ),
  //             ),
  //             child: const Text('Daily timeline'),
  //           ),
  //           const SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: () => Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (_) => const WeeklyTimetable(),
  //               ),
  //             ),
  //             child: const Text('Weekly timeline'),
  //           ),
  //           const SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: () => Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (_) => const GanttChart(),
  //               ),
  //             ),
  //             child: const Text('Gantt chart'),
  //           ),
  //         ],
  //       );
  // }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
