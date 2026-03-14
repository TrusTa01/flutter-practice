import 'package:flutter/material.dart';
import 'package:flutter_application_default/l10n/gen/app_localizations.dart';

extension LocalizedContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
