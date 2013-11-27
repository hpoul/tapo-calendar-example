library calendar_example;

import 'package:polymer/polymer.dart';
import 'package:tapo_calendar/calendarview/calendarview.dart';

@CustomTag('calendar-example')
class CalendarExample extends PolymerElement {
  @observable CalendarEvent selectedevent;
  
  CalendarExample.created() : super.created();
}