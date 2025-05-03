import 'package:flutter/material.dart';
import 'package:venille/components/text/body_text.dart';
import 'package:venille/core/constants/colors.dart';

class LetterAvatar extends StatelessWidget {
  final String name;
  final double radius;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;

  const LetterAvatar({
    super.key,
    required this.name,
    this.radius = 25,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.fontSize,
  });

  Color _getAvatarColor(String name) {
    if (name.isEmpty) return AppColors.primaryColor;

    final List<Color> colors = [
      Colors.blue[400]!,
      Colors.amber[600]!,
      Colors.purple[400]!,
      Colors.green[500]!,
      Colors.pink[400]!,
      Colors.teal[400]!,
      Colors.indigo[400]!,
      Colors.orange[600]!,
      Colors.cyan[600]!,
      Colors.deepPurple[400]!,
    ];

    // Sanitize name before getting hashCode
    final sanitizedName = _sanitizeString(name);
    final int hashCode = sanitizedName.hashCode;
    final int colorIndex = hashCode.abs() % colors.length;

    return colors[colorIndex];
  }

  String _sanitizeString(String input) {
    try {
      // Remove any non-printable characters
      return input.replaceAll(RegExp(r'[^\x20-\x7E]'), '').trim();
    } catch (e) {
      return '?';
    }
  }

  String _getInitials(String name) {
    try {
      // Sanitize the input first
      final sanitizedName = _sanitizeString(name);
      if (sanitizedName.isEmpty) return '?';

      final nameParts =
          sanitizedName.split(' ').where((part) => part.isNotEmpty).toList();

      if (nameParts.isEmpty) return '?';

      if (nameParts.length == 1) {
        return nameParts[0][0].toUpperCase();
      }

      return '${nameParts[0][0]}${nameParts.last[0]}'.toUpperCase();
    } catch (e) {
      debugPrint('Error getting initials: $e');
      return '?';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? _getAvatarColor(name),
      child: BodyText(
        text: _getInitials(name),
        color: AppColors.whiteColor,
      ),
    );
  }
}
