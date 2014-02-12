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

  void enteredView() {
    super.enteredView();
    var start1 = new DateTime.now().subtract(const Duration(hours:2));
    var start3 = new DateTime(start1.year, start1.month, start1.day, 8);
    var start4 = new DateTime(start1.year, start1.month, start1.day, 6);
    var start5 = new DateTime(start1.year, start1.month, start1.day, 8, 30);
    var start6 = new DateTime(start1.year, start1.month, start1.day, 8, 15);
    _calendarView.annotations = [new CalendarEvent(5, start1, start1.add(const Duration(minutes: 40)), "Just Testing with a very long line of text to test if we are correctly wrapping.", null),
                                 new CalendarEvent(7, new DateTime.now().subtract(const Duration(hours:4)), null, "Just Testing", null),
                                 new CalendarEvent(9, start3, start3.add(const Duration(minutes: 120)), "testing 30 minutes line.", null),
                                 new CalendarEvent(11, start4, null, "testing full hour without duration.", null),
                                 new CalendarEvent(12, start5, start5.add(const Duration(minutes: 25)), "parallel annotations.", null),
                                 new CalendarEvent(14, start6, start6.add(const Duration(minutes: 60)), "second parallel annotations.", null),
    ];
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