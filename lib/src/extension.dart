import 'package:flutter/widgets.dart';
import 'package:smart_localize/src/localization_delegate.dart';

String translate(
  String key, {
  BuildContext? context,
}) {
  return context == null
      ? LocalizeDelegate.instance.tr(key)
      : LocalizeDelegate.of(context)!.tr(key);
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
