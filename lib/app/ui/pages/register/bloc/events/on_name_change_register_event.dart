import 'package:le_libros/app/ui/pages/register/bloc/events/register_event.dart';

class OnNameChangeRegisterEvent extends RegisterEvent {
  final String input;

  OnNameChangeRegisterEvent(this.input);
}
