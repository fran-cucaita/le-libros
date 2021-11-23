import 'package:le_libros/app/ui/pages/register/bloc/events/register_event.dart';

class OnPasswordChangeRegisterEvent extends RegisterEvent {
  final String input;

  OnPasswordChangeRegisterEvent(this.input);
}
