import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Language
enum Language { en, vi }

extension LanguageExtension on Language {
  String get code {
    switch (this) {
      case Language.en:
        return 'en';
      case Language.vi:
        return 'vi';
    }
  }

  Locale get locale => Locale(code);
}
