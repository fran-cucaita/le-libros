import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:le_libros/app/domain/inputs/sign_up.dart';
import 'package:le_libros/app/domain/repositories/signup_repository.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/on_email_change_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/on_lastname_change_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/on_name_change_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/on_password_change_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/on_v_password_change_register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/events/register_event.dart';
import 'package:le_libros/app/ui/pages/register/bloc/states/register_state.dart';
import 'package:le_libros/app/ui/routes/routes.dart';
import 'package:le_libros/widgets/dialogs/dialogs.dart';
import 'package:le_libros/widgets/dialogs/progress_dialog.dart';

import 'events/do_register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState.initialState) {
    on<DoRegisterEvent>((event, emit) async {
      // pushea nueva pantalla con un loading
      ProgressDialog.show(event.context);

      // await registrarse
      final _signUpRepository = Get.i.find<SignUpRepository>();

      final response = await _signUpRepository.register(SignUpData(
          name: state.name,
          lastname: state.lastname,
          email: state.email,
          password: state.password));

      // pop del loading
      router.pop();

      // si hay error entonces pushear un Dialog.alert(...)
      if (response.error != null) {
        late String content;
        switch (response.error) {
          case SignUpError.emailAlreadyInUse:
            content = "email already in use";
            break;
          case SignUpError.weakPassword:
            content = "weak password";
            break;
          case SignUpError.unknow:
          default:
            content = "unknow";
            break;
        }
        Dialogs.alert(event.context, title: "ERROR", content: content);
      } else {
        // sino entonce pusheamos el home
        router.pushNamedAndRemoveUntil(Routes.Home);
      }
    });

    on<OnEmailChangeRegisterEvent>((event, emit) async {
      emit(state.copyWith(email: event.input));
    });

    on<OnNameChangeRegisterEvent>((event, emit) async {
      emit(state.copyWith(name: event.input));
    });

    on<OnLastNameChangeRegisterEvent>((event, emit) async {
      emit(state.copyWith(lastname: event.input));
    });

    on<OnPasswordChangeRegisterEvent>((event, emit) async {
      emit(state.copyWith(password: event.input));
    });

    on<OnVPasswordChangeRegisterEvent>((event, emit) async {
      emit(state.copyWith(vPassword: event.input));
    });
  }
}
