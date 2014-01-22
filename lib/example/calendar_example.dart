library calendar_example;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:tapo_calendar/calendarview/calendarview.dart';

@CustomTag('calendar-example')
class CalendarExample extends PolymerElement {
  @observable CalendarEvent selectedevent;
  
  CalendarExample.created() : super.created() {
    onPropertyChange(this, #selectedevent, (){
      print('detected selected event changed.');
    });
  }
  
  CalendarView get _calendarView => $['calendarview'];
  
  zoomInClicked(Event event, var detail, Node target) {
    print("zoomInClicked.");
    _calendarView.zoomIn();
  }
  zoomOutClicked(Event event, var detail, Node target) {
    _calendarView.zoomOut();
  }
}