library calendar_example;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:tapo_calendar/calendarview/calendarview.dart';
import 'dart:async';

@CustomTag('calendar-example')
class CalendarExample extends PolymerElement {
  @observable CalendarEvent selectedevent;
  
  CalendarExample.created() : super.created() {
    onPropertyChange(this, #selectedevent, (){
      print('detected selected event changed.');
    });
  }

  @override
  void attached() {
    super.attached();
    // wait a second before populating calendar
    new Timer(const Duration(seconds: 1), (){
      var start1 = new DateTime.now().subtract(const Duration(hours:2));
      var start3 = new DateTime(start1.year, start1.month, start1.day, 8);
      var start4 = new DateTime(start1.year, start1.month, start1.day, 6);
      var start5 = new DateTime(start1.year, start1.month, start1.day, 8, 30);
      var start6 = new DateTime(start1.year, start1.month, start1.day, 8, 15);
      var start7 = new DateTime(start1.year, start1.month, start1.day, 6, 0, 30);
      _calendarView.annotations = [new CalendarAnnotation(5, start1, start1.add(const Duration(minutes: 40)), "Just Testing with a very long line of text to test if we are correctly wrapping.", null),
                                   new CalendarAnnotation(7, new DateTime.now().subtract(const Duration(hours:4)), null, "Just Testing", null),
                                   new CalendarAnnotation(9, start3, start3.add(const Duration(minutes: 120)), "testing 30 minutes line.", null),
                                   new CalendarAnnotation(11, start4, null, "testing full hour without duration.", null),
                                   new CalendarAnnotation(17, start7, null, "testing full hour with 30 secs offset.", null),
                                   new CalendarAnnotation(12, start5, start5.add(const Duration(minutes: 25)), "parallel annotations.", null),
                                   new CalendarAnnotation(14, start6, start6.add(const Duration(minutes: 60)), "second parallel annotations.", null),
                                   new CalendarAnnotation(15, start6, start6.add(const Duration(minutes: 60)), "second parallel annotations.", null, actions: [new CalendarAnnotationAction('open', 'Open', href: 'http://www.google.com'), new CalendarAnnotationAction('remove', 'Remove')]),
                                   new CalendarAnnotation(19, start6, start6.add(const Duration(minutes: 1)), "short duration.", null),
      ];
      _calendarView.scrollTo(5);
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
  
  annotationActionSelected(Event event, var detail, Node target) {
    if (detail is CalendarAnnotationActionSelectedDetail) {
      if (detail.action.key == 'remove') {
        window.alert("TODO: delete annotation ${detail.annotation.title}");
      }
    }
  }
}