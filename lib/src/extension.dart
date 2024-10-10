import 'package:flutter/widgets.dart';
import 'package:main_app_strings/src/localization_file.dart';

String translate(
  String key, {
  BuildContext? context,
}) {
  return context == null
      ? MainAppStrings.instance.tr(key)
      : MainAppStrings.of(context)!.tr(key);
}

extension StringExtension on String {
  String tr({
    BuildContext? context,
  }) =>
      translate(
        this,
        context: context,
      );
}

extension StringExtensionText on Text {
  Text get trans => Text(
        translate(data ?? ''),
        key: key,
        style: style,
        strutStyle: strutStyle,
        textDirection: textDirection,
        textAlign: textAlign,
        softWrap: softWrap,
        overflow: overflow,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        locale: locale,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
      );
}
