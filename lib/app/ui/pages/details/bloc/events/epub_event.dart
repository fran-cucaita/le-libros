import 'detail_event.dart';

class EpubDetailsEvent extends DetailEvent {
  final String link;
  final String code;
  final String title;
  const EpubDetailsEvent(this.link, this.code, this.title);
}
