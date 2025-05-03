import 'package:flutter/material.dart';

class VenilleIconBadge extends StatelessWidget {
  const VenilleIconBadge({super.key, this.size = 25});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/icon_venille_clif.png',
      width: size,
      fit: BoxFit.cover,
    );
  }
}
