import 'package:bloc/bloc.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/states/register_state.dart';
import 'package:le_libros/app/ui/routes/routes.dart';
import 'package:le_libros/widgets/dialogs/progress_dialog.dart';

import '../register_page.dart';
import 'events/do_register_event.dart';
import 'package:flutter_meedu/router.dart' as router;

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(RegisterState initialState) : super(initialState) {
    on<DoRegisterEvent>((event, emit) async {
      final controller = registerProvider.read;

      // event.name event.surname

      // pushea nueva pantalla con un loading
      //ProgressDialog.show(context);
      // await registrarse
      final response = await controller.submit();
      // pop del loading
      router.pop();
      // si hay error entonces pushear un Dialog.alert(...)
      if (response.error != null) {
        print('Hay un error');
      }
      // sino entonce pusheamos el home
      else {
        router.pushNamedAndRemoveUntil(Routes.Home);
      }
      // sendRegisterForm(...)
      // no hay que hacer emit
    });
  }
}
