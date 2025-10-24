import 'package:flutter/material.dart';

class ZoneIndicator extends StatelessWidget {
  final String zoneText; // Texto de la zona, ej: "0 | 12"

  const ZoneIndicator({
    super.key,
    required this.zoneText,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.black.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.white54 : Colors.black54,
          width: 1,
        ),
      ),
      child: Text(
        zoneText,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
