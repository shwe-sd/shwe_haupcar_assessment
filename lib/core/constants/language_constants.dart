import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String ENGLISH = 'en';
const String MYANMAR = 'my';
const String THAILAND = 'th';

const List<Locale> supportedLocales = [
  Locale(ENGLISH),
  Locale(MYANMAR),
  Locale(THAILAND)
];

extension TranslateExtension on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}
