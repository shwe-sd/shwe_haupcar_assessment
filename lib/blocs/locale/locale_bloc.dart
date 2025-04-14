import 'package:flutter_bloc/flutter_bloc.dart';
import 'locale_event.dart';
import 'locale_state.dart';
import 'package:flutter/material.dart';


class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState(Locale('en'))) {
    on<ChangeLocale>((event, emit) {
      emit(LocaleState(event.locale));
    });
  }
}
