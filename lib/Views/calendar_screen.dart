import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:timelines/timelines.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 500,
              child: SfCalendar(
                headerStyle: const CalendarHeaderStyle(
                  backgroundColor: Color.fromRGBO(121, 135, 119, 1),
                ),
                viewHeaderStyle: const ViewHeaderStyle(
                  backgroundColor: Color.fromRGBO(186, 201, 182, 1.0)
                ),
                view: CalendarView.month,
                dataSource: MeetingDataSource(_getDataSource()),
                monthViewSettings: const MonthViewSettings(
                  agendaStyle: AgendaStyle(
                    backgroundColor: Colors.red
                  ),
                  monthCellStyle: MonthCellStyle(
                    backgroundColor: Colors.white24,
                    todayBackgroundColor: Colors.white24,
                    trailingDatesBackgroundColor: Colors.black12,
                    leadingDatesBackgroundColor: Colors.black12,
                    textStyle: TextStyle(color: Colors.black),
                    leadingDatesTextStyle: TextStyle(color: Colors.black54),
                    trailingDatesTextStyle: TextStyle(color: Colors.black54),
                  ),
                  appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white10
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: FixedTimeline.tileBuilder(
                  verticalDirection:VerticalDirection.down,
                  builder: TimelineTileBuilder.connectedFromStyle(
                    connectionDirection: ConnectionDirection.after,
                    contentsAlign: ContentsAlign.basic,
                    oppositeContentsBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('01 Feb 2022', style: TextStyle(color: Colors.black54),),
                    ),
                    firstConnectorStyle: ConnectorStyle.dashedLine,
                    lastConnectorStyle: ConnectorStyle.dashedLine,
                    contentsBuilder: (context, index) => const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. '),
                      ),
                    ),
                    connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
                    indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                    itemCount: 5,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: ()=>context,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(121, 135, 119, 1))
              ),
              child: const Text('Add Event')
            ),
          )
        ],
      )
    );
  }
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
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