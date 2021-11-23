//TODO: va a tener que tener la información para registrarse vamos a necesitar el BuildContext sino no vamos a poder pushear y hacer pop de las cosas
// Navigator.of(context).push(...) .pop() .pushAndReplace(...)

import 'package:flutter/material.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/register_event.dart';

class OnLastNameChangeRegisterEvent extends RegisterEvent {
  final String input;

  OnLastNameChangeRegisterEvent(this.input);
}
