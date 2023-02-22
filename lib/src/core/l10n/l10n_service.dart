import 'package:arfilming/src/core/l10n/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class L10n {
  const L10n();

  static S get current => S.current;
  static S of(BuildContext context) => S.of(context);

  static const english = Locale('en', 'US');
  static const russian = Locale('ru', 'RU');
}
