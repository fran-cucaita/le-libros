import 'detail_event.dart';

class MobiDetailsEvent extends DetailEvent {
  final String link;
  final String code;
  final String title;
  const MobiDetailsEvent(this.link, this.code, this.title);
}
