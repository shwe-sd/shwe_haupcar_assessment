import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'locale_event.dart';
import 'locale_state.dart';
import 'package:flutter/material.dart';


class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  static const String _localeKey = 'selected_locale';

  LocaleBloc() : super(const LocaleState(Locale('en'))) {
    on<ChangeLocale>(_onChangeLocale);
    _loadSavedLocale();
  }

  // Load the saved locale from SharedPreferences
  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey);
    print("Loaded locale: $localeCode");
    if (localeCode != null) {
      add(ChangeLocale(Locale(localeCode)));  // Emit event to update the locale
    }
  }

  // Save the selected locale to SharedPreferences
  Future<void> _onChangeLocale(ChangeLocale event, Emitter<LocaleState> emit) async {
    emit(LocaleState(event.locale));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, event.locale.languageCode);  // Persist the locale
  }
}
