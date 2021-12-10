import 'package:bloc/bloc.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:le_libros/app/ui/pages/details/bloc/events/detail_event.dart';
import 'package:le_libros/app/ui/pages/details/bloc/states/detail_state.dart';
import 'package:le_libros/helpers/http_helper.dart';

import 'events/epub_event.dart';
import 'events/mobi_event.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final HttpHelper httpHelper;
  DetailBloc(this.httpHelper) : super(const LoadingDetailState()) {
    on<LoadDetailsEvent>((event, emit) async {
      emit(const LoadingDetailState());
      try {
        final details = await httpHelper.getBookDetails(event.code);
        emit(LoadedDetailState(details: details));
      } catch (err) {
        print(err);
        emit(const ErrorDetailState());
      }
    });
    on<EpubDetailsEvent>((event, emit) async {
      String bookPath = await httpHelper.downloadLink(event.link, event.code);
      final MailOptions mailOptions = MailOptions(
        subject: event.title,
        attachments: [bookPath],
      );
      final MailerResponse response = await FlutterMailer.send(mailOptions);
    });
    on<MobiDetailsEvent>((event, emit) async {
      String bookPath = await httpHelper.downloadLink(event.link, event.code);
      final MailOptions mailOptions = MailOptions(
        subject: event.title,
        attachments: [bookPath],
      );
      final MailerResponse response = await FlutterMailer.send(mailOptions);
    });
  }
}
