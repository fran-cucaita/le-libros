import 'package:bloc/bloc.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/states/register_state.dart';

import 'events/do_register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(RegisterState initialState) : super(initialState) {
    on<DoRegisterEvent>((event, emit) async {
      // event.name event.surname
      // pushea nueva pantalla con un loading
      // await registrarse
      // pop del loading
      // si hay error entonces pushear un Dialog.alert(...)

      // sino entonce pusheamos el home

      // sendRegisterForm(...)
      // no hay que hacer emit
    });
  }
}
