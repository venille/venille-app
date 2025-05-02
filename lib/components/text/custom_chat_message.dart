// ignore_for_file: must_be_immutable
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class CustomChatMessage extends StatelessWidget {
  final String text;
  Color? color;
  double? size;
  int? maxLines;
  double? lineHeight;
  FontWeight? weight;
  TextDecoration? decoration;
  Color? decorationColor;
  double? decorationThickness;
  TextAlign? alignment;
  FontStyle? fontStyle;
  String? fontFamily;
  Color? linkColor;

  CustomChatMessage({
    super.key,
    this.color,
    this.size,
    this.maxLines,
    this.weight,
    this.decoration,
    this.fontFamily,
    this.fontStyle,
    this.decorationColor,
    this.decorationThickness,
    this.lineHeight,
    this.alignment,
    this.linkColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Linkify(
      onOpen: (link) async {
        if (link.url.startsWith('tel:')) {
          log('[PHONE_NUMBER] :: ${link.url}');
        }

        if (await canLaunchUrl(Uri.parse(link.url))) {
          await launchUrl(Uri.parse(link.url),
              mode: LaunchMode.externalApplication);
        } else {
          log('Could not launch ${link.url}');
        }
      },
      text: text,
      maxLines: maxLines ?? 6,
      textAlign: alignment ?? TextAlign.left,
      linkifiers: const [UrlLinkifier(), PhoneLinkifier()],
      style: TextStyle(
        color: color,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: decorationColor ?? Colors.transparent,
        decorationThickness: decorationThickness ?? 0,
        height: lineHeight ?? 0,
        fontSize: 12,
        fontWeight: weight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontFamily: fontFamily ?? 'Roboto',
      ),
      linkStyle: TextStyle(
        color: linkColor ?? Colors.blue,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

final _phoneRegex = RegExp(
  r'(\+1\d{10})',
  caseSensitive: false,
  dotAll: true,
);

class PhoneLinkifier extends Linkifier {
  const PhoneLinkifier();

  @override
  List<LinkifyElement> parse(elements, options) {
    final list = <LinkifyElement>[];

    for (var element in elements) {
      if (element is TextElement) {
        final match = _phoneRegex.firstMatch(element.text);

        if (match == null) {
          list.add(element);
        } else {
          // Extract the text before the match, the matched phone number, and the remaining text
          final beforeMatch = element.text.substring(0, match.start);
          final matchedPhoneNumber =
              match.group(1)!; // The full phone number match
          final afterMatch = element.text.substring(match.end);

          if (beforeMatch.isNotEmpty) {
            list.add(TextElement(beforeMatch));
          }

          list.add(
              PhoneElement(matchedPhoneNumber)); // Add the matched phone number

          if (afterMatch.isNotEmpty) {
            list.addAll(parse([TextElement(afterMatch)], options));
          }
        }
      } else {
        list.add(element);
      }
    }

    return list;
  }
}

/// Represents an element containing a phone number
class PhoneElement extends LinkableElement {
  final String phoneNumber;

  PhoneElement(this.phoneNumber) : super(phoneNumber, 'tel:$phoneNumber');

  @override
  String toString() {
    return "PhoneElement: '$phoneNumber' ($text)";
  }

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, originText, url, phoneNumber);

  @override
  bool equals(other) =>
      other is PhoneElement &&
      super.equals(other) &&
      other.phoneNumber == phoneNumber;
}
